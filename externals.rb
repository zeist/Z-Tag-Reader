#!/usr/bin/env ruby

system("git submodule init")
system("git submodule update")

Dir.foreach("external") { |file|\
if file != "." && file != ".."
  system("./"+file+"externals.rb")
end
}
