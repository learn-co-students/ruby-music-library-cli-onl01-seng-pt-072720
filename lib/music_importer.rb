class MusicImporter
    def initialize(path)
        @path = path
    end
    def path
        @path
    end
    def files
        files = Dir.entries(self.path)
        files.shift
        files.shift
        files
    end
    def import
        self.files.each do |file|
            Song.create_from_filename(file)
        end
    end
end