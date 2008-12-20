srvany_manager
    by James Tucker
    http://ra66i.org
    http://github.com/raggi/srvany_manager

== DESCRIPTION:

A quick and simple manager for running programs as services on win32. Makes 
use of / requires the SRVANY.exe from the Windows Resource Kit.

== FEATURES/PROBLEMS:

* It's simple.

== SYNOPSIS:

  sm = SrvanyManager.new('rbsvc-', File.expand_path("srvany.exe"))
  sm.create('foo', "c:\ruby18\bin\rubyw c:\daemon\my_awesome_daemon.rb")
  sm.start('foo')
  sm.stop('foo')
  sm.delete('foo')
  sm.list

== REQUIREMENTS:

At the time of writing, some of the dependencies are only available as gems to
the 'x86-mswin32-60' platform. If you are installing on mingw, you can get
away with installing them using a specific --platform argument to rubygems.

* gem inst win32-service win32-registry

== INSTALL:

* gem inst srvany_manager

== LICENSE:

(The MIT License)

Copyright (c) 2008 James Tucker

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
