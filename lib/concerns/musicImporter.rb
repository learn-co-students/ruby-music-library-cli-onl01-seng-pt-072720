class MusicImporter
    def initialize(path)
        @path = path
    end

    def files
        filenames = []
        Dir[@path + "/*.mp3"].each do | file |
            filenames << file.split("/").last
        end
        filenames
    end

    def path
        @path
    end

    def import
        files.each do | file |
            Song.create_from_filename(file)
        end
    end
end