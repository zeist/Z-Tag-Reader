#!/usr/bin/ruby
programdir = File.dirname(__FILE__);
load programdir+"/readers/wavpackreader.rb"
load programdir+"/readers/flacreader.rb"
load programdir+"/external/config/config.rb"
class Tagreader 
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
	# Wavpack Tags
	#
	def wavpackRead(i_file)
		wr = Wavpackreader.new
		wr.readTags(i_file)

		@artist = wr.artist
		@album = wr.album
		@title = wr.title
		@genre = wr.genre
		@date = wr.date
		@tracknumber = wr.tracknumber
	end

	#
	# Flac Tags
	#
	def flacRead(i_file)
		fr = Flacreader.new
		fr.readTags(i_file)
		@artist = fr.artist
		@album = fr.album
		@title = fr.title
		@genre = fr.genre
		@date = fr.date
		@tracknumber = fr.tracknumber
	end

	#
	# Read Tags From File
	#
	def readTags(i_file, i_type)
		puts i_type
		
		if i_type == "wavpack"
			wavpackRead(i_file)
		end

		if i_type == "flac"
			flacRead(i_file)
		end

		#Output Information
		if @config.getOption("Verbose") == "yes"
			puts "Artist: "+@artist
			puts "Album: "+@album
			puts "Title: "+@title
			puts "Tracknumber: "+@tracknumber	
			puts "Date: "+@date
			puts "Genre: "+@genre
		end
	end

end
