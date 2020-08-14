class MusicImporter
    attr_accessor :path, :files
   
    
    def initialize(file_path)
        @path = file_path
        @files = [] 
    end 

    def files
        Dir.entries(@path).each do |file| 
           if file.match(/.+.mp3/)
            @files << file 
           end
        end
        @files
    end

    def import
        self.files.each {|file| Song.create_from_filename(file)}
    end
end