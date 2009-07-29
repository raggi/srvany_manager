# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'srvany_manager'

task :default => 'spec'

PROJ.name = 'srvany_manager'
PROJ.authors = 'James Tucker'
PROJ.email = 'raggi@rubyforge.org'
PROJ.url = 'http://github.com/raggi/srvany_manager'
PROJ.rubyforge.name = 'libraggi'
PROJ.version = SrvanyManager.version
PROJ.gem.dependencies = [%w(win32-service >=0.7.0)] # TODO where does win32/registry come from?

PROJ.exclude = %w(tmp$ bak$ ~$ CVS \.git \.hg \.svn ^pkg ^doc \.DS_Store
  \.cvs \.svn \.hgignore \.gitignore \.dotest \.swp$ ~$)
