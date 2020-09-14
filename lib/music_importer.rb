class MusicImporter
    
    @files = []
    
    def initialize(path)
        @path = path
    end

    def path
        @path.split(".")[1]
    end

    def files
        Dir.entries(@path).select {|entry| entry.chomp("./spec/fixtures/mp3s")}
    end


end