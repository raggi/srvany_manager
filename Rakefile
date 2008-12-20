# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'srvany_manager'

task :default => 'spec:run'

PROJ.name = 'srvany_manager'
PROJ.authors = 'James Tucker'
PROJ.email = 'raggi@rubyforge.org'
PROJ.url = 'http://github.com/raggi/srvany_manager'
PROJ.rubyforge.name = 'raggi'
PROJ.version = SrvanyManager.version
PROJ.dependencies = %(win32-service) # TODO where does win32/registry come from?

PROJ.exclude = %w(tmp$ bak$ ~$ CVS \.git \.hg \.svn ^pkg ^doc \.DS_Store
  \.cvs \.svn \.hgignore \.gitignore \.dotest \.swp$ ~$)

namespace :gem do
  file 'srvany_manager.gemspec' => (`git ls-files`.split - 'srvany_manager.gemspec') do |t|
    open(t.name, 'w') { |f| f.write PROJ.gem._spec.to_ruby }
  end
  task :spec => 'srvany_manager.gemspec'
end