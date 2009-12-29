#!/usr/bin/ruby
load $configPath+"/config.rb"
class Wavpackreader 
	attr_accessor :artist
	attr_accessor :album
	attr_accessor :title
	attr_accessor :date
	attr_accessor :genre
	attr_accessor :tracknumber
    attr_accessor :lyrics
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

		cmd = "wvunpack -ss \""+i_file+"\""
		out = `#{cmd}`
		test = out.split(/\n/)

		for i in 0..test.size-1 do
			test[i]=test[i].strip
			if test[i][0..4].downcase == "track"
				@tracknumber = test[i][7..test[i].size].strip
			end
			if test[i][0..4].downcase == "album"
				@album = test[i][7..test[i].size].strip
			end
			if test[i][0..4].downcase == "genre"
				@genre = test[i][7..test[i].size].strip
			end
			if test[i][0..4].downcase == "title"
				@title = test[i][7..test[i].size].strip
			end
			if test[i][0..5].downcase == "artist"
				@artist = test[i][8..test[i].size].strip
			end
			if test[i][0..3].downcase == "year"
				@date = test[i][6..test[i].size].strip
            end
            if test[i][0..5].downcase == "lyrics"
                @capturelyricsenabled = true
			end
            for j in (1..test[i].size)
              if test[i][j] == "="
                @capturelyricsenabled = false
              end
            end
    	end
	end

end
