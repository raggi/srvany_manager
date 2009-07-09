class SrvanyManager

  Version = VERSION = '0.1.3'
  def self.version
    Version
  end

  def self.load_dependencies
    once = false
    require 'win32/service'
    require 'win32/registry'
  rescue LoadError => e
    raise e if once
    require 'rubygems'
    once = true
    retry
  end

  # Construct a new service manager, just sets up a name_key, which is used
  # as a leading string to the name of all services managed by the instance.
  # srv_any_path must be a full path to srvany.exe.
  def initialize(name_key = 'SRVANY_', srv_any_path = "#{ENV['ProgramFiles']}\\Windows Resource Kits\\Tools\\srvany.exe")
    self.class.load_dependencies
    @name_key = name_key
    @srv_any_path = srv_any_path
  end

  # Create a new service. The service name will be appended to the name_key
  # and inserted into the registry using Win32::Service. The arguments are 
  # then adjusted with win32-registry.
  # One recommended pattern is to store persisence details about the service
  # as yaml in the optional description field.
  def create(name, command, args = '', description = nil, options = {})
    defaults = {
      :service_type       => Win32::Service::WIN32_OWN_PROCESS,
      :start_type         => Win32::Service::DEMAND_START,
      :error_control      => Win32::Service::ERROR_NORMAL
      }.merge(options)
      name = @name_key + name.to_s
      options = defaults.merge(
      :display_name       => name,
      :description        => description || name,
      :binary_path_name   => @srv_any_path
      )
      Win32::Service.create(options)
      # `#{@ins_srv_path} #{name} "#{@srv_any_path}"`
      registry(name) do |reg|
        reg.create('Parameters') do |params|
          params.write_i("Start", 3)
          params.write_s("Application", command)
          params.write_s("AppParameters", args)
        end
      end
    end

    # Mark a service for deletion (note, does not terminate the service)
    def delete(name)
      Win32::Service.delete(@name_key + name.to_s)
    end

    def start(name)
      Win32::Service.start(@name_key + name.to_s)
    end

    def stop(name)
      Win32::Service.stop(@name_key + name.to_s)
    end

    # Returns an array of tuples of name and description
    def list
      services = Win32::Service.services.select do |svc|
        # TODO in future, 1.8.7, can use start_with?
        svc.display_name[0,@name_key.size] == @name_key
      end
      services.map do |svc_info|
        name = svc_info.display_name
        [name.slice(@name_key.size, name.size), svc_info.description]
      end
    end

    private
    def registry(name, &block)
      Win32::Registry::HKEY_LOCAL_MACHINE.open(
      "SYSTEM\\CurrentControlSet\\Services", 
      Win32::Registry::KEY_WRITE | Win32::Registry::KEY_READ
      ).open(name, &block)
    end

  end
