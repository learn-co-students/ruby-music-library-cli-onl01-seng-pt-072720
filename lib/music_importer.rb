class MusicImporter

    attr_reader :path

    def initialize(path)
        @path = path
    end

    #files
    # loads all the MP3 files in the path directory (FAILED - 1)
    # normalizes the filename to just the MP3 filename with no path (FAILED - 2)
    def files
        filename = Dir.glob("#{path}/*.mp3")
        filename = filename.collect{|a_string| a_string.sub("#{path}/", "")}
    end
    
    def import
        files.each{ |f| Song.create_from_filename(f) }
    end


end
