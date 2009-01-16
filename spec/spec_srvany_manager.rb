require File.dirname(__FILE__) + '/helper'

# Because sometimes, I just wanna spec on another platform...
module Win32
  module Registry
    HKEY_LOCAL_MACHINE = self
    KEY_WRITE = self
    KEY_READ = self
    def self.method_missing(name, *args)
      self
    end
  end

  module Service
    WIN32_OWN_PROCESS, DEMAND_START, ERROR_NORMAL = nil
    class <<self
      attr_accessor :services, :started, :stopped
    end

    def self.create(name, *args)
      @services << [name, *args]
    end

    def self.delete(name)
      @services.delete_if { |svc| svc.first == name }
    end

    def self.start(name)
      @started << name
    end

    def self.stop(name)
      @stopped << name
    end

    def self.services
      @services.map { |name, args| def name.description; 'descrip'; end; def name.display_name; self; end; name }
    end

    def self.list
      @services.map { |name, args| def name.description; 'descrip'; end; def name.display_name; self; end; name }
    end

    def self.clear!
      @services, @started, @stopped = [], [], []
    end
  end
end


describe 'ServiceManager' do
  before do
    @prefix = 'SM_TEST_'
    @sm = SrvanyManager.new(@prefix)
    # N.B. this is a mock, setup in helper
    Win32::Service.clear!
  end

  should 'create services with name prefixes' do
    @sm.create('bar', 'false.exe')
    service_names = Win32::Service.list.select { |obj| obj.display_name }
    service_names.should.include?(@prefix + 'bar')
    service_names.size.should.eql(1)
  end

  should 'delete services' do
    @sm.create('bar', 'false.exe')
    service_names = Win32::Service.list.select { |obj| obj.display_name }
    service_names.should.include?(@prefix + 'bar')
    service_names.size.should.eql(1)
    @sm.delete('bar')
    service_names = Win32::Service.list.select { |obj| obj.display_name }
    service_names.should.not.include?(@prefix + 'bar')
    service_names.size.should.eql(0)
  end

  should 'list services' do
    @sm.create('bar', 'false.exe', 'args', 'descrip')
    @sm.list.should.include?(['bar', 'descrip'])
    @sm.list.size.should.eql(Win32::Service.list.size)
  end
end

describe 'ServiceManager service control' do
  before do
    @prefix = 'SM_TEST_'
    @sm = SrvanyManager.new(@prefix)
    Win32::Service.clear!
    @name = 'test_service'
    @command = 'foo.exe'
    @sm.create(@name, @command)
  end

  should 'stop services' do
    @sm.stop(@name)
    Win32::Service.stopped.should.include?(@prefix + @name)
  end

  should 'start services' do
    @sm.start(@name)
    Win32::Service.started.should.include?(@prefix + @name)
  end
end