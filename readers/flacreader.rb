#!/usr/bin/ruby
load $configPath+"/config.rb"
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
		if(@artist.nil? || @artist=="")
          @artist="Empty"
        else
          @artist = @artist[7..@artist.size].strip
        end

		#Title
		cmd = initialcmd + "title \""+i_file+"\""
		@title = `#{cmd}`
        if(@title.nil? || @titile="")
          @title = "Empty"
        else
          @title = @title[6..@title.size].strip
        end

		#Date
		cmd = initialcmd + "date \""+i_file+"\""
		@date = `#{cmd}`
        if(@date.nil? || @date=="")
          @date="0000"
        else
          @date = @date[5..@date.size].strip
        end

		#Genre
		cmd = initialcmd + "genre \""+i_file+"\""
		@genre = `#{cmd}`
        if(@genre.nil? || @genre=="")
          @genre = "Empty"
        else
          @genre = @genre[6..@genre.size].strip
        end
		
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
