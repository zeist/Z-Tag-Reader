#!/usr/bin/ruby
load $rubydir+"/config/config.rb"
class Flacreader 
	attr_accessor :artist
	attr_accessor :album
	attr_accessor :title
	attr_accessor :date
	attr_accessor :genre
	attr_accessor :tracknumber
	def initialize()
		@config = Config.new
	end

	#
	# Read Config
	#
	def readConfig(i_path)
		#Load Config File
		@config.Load(i_path)
	end

	#
	# Read Tags From File
	#
	def readTags(i_file)
		initialcmd = "metaflac --show-tag="

		#Artist
		cmd = initialcmd + "artist \""+i_file+"\""
		@artist = `#{cmd}`		
		@artist = @artist[7..@artist.size].strip

		#Title
		cmd = initialcmd + "title \""+i_file+"\""
		@title = `#{cmd}`
		@title = @title[6..@title.size].strip

		#Date
		cmd = initialcmd + "date \""+i_file+"\""
		@date = `#{cmd}`
		@date = @date[5..@date.size].strip

		#Genre
		cmd = initialcmd + "genre \""+i_file+"\""
		@genre = `#{cmd}`
		@genre = @genre[6..@genre.size].strip
		
		#Album
		cmd = initialcmd + "album \""+i_file+"\""
		@album = `#{cmd}`
		@album = @album[6..@album.size].strip		

		#Track Number
		cmd = initialcmd + "tracknumber \""+i_file+"\""
		@tracknumber = `#{cmd}`
		@tracknumber = @tracknumber[12..@tracknumber.size].strip
	end

end
