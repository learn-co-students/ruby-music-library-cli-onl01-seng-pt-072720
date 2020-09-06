class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        files = Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/","")}
    end

    def import 
        files.each {|song_file|Song.create_from_filename(song_file)}
    end

end