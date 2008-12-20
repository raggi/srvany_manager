# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{srvany_manager}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Tucker"]
  s.date = %q{2008-12-20}
  s.description = %q{A quick and simple manager for running programs as services on win32. Makes  use of / requires the SRVANY.exe from the Windows Resource Kit.}
  s.email = %q{raggi@rubyforge.org}
  s.extra_rdoc_files = ["History.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/srvany_manager.rb", "spec/.bacon", "spec/helper.rb", "spec/runner", "spec/spec_srvany_manager.rb", "tasks/ann.rake", "tasks/autospec.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/manifest.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/raggi/srvany_manager}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{raggi}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A quick and simple manager for running programs as services on win32}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<win32-service>, [">= 0"])
    else
      s.add_dependency(%q<win32-service>, [">= 0"])
    end
  else
    s.add_dependency(%q<win32-service>, [">= 0"])
  end
end
