#when console loads, this is the file that gets loaded
require_relative "admin/container"

Admin::Container.finalize! #this will cause unfinalized console to run. This is the part that's performing magic

require "admin/application"
