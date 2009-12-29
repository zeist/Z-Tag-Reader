#!/usr/bin/env ruby
#ENV['RUBYDIR']
$configPath = "/home/ashaman/Projects/GitHub/ruby/Z-Ruby-Config"

require "../tagreader.rb"

if ARGV.size > 0

  testFile = ARGV[0]

  tr = Tagreader.new
  tr.readTags(testFile, "wavpack")
	
  puts tr.artist
  puts tr.title
  puts tr.album
  puts tr.date
  puts tr.genre
  puts tr.tracknumber
else
  puts "Usage: tagreaderex.rb <filename>"
end
