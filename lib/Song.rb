class Song

    extend Concerns::Findable

    attr_accessor :name, :artist, :songs, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(song)
        song = self.new(song)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        self.genre.add_song(self)
    end

    #def self.find_by_name(s_name)
    #    self.all.find{|song|song.name == s_name}
    #end

    #def self.find_or_create_by_name(name)
    #    song = self.find_by_name(name)
    #    if song == nil
    #        self.create(name)
    #    else
    #        song
    #    end
    #end

    def self.create_from_filename(song_file)
        song_file = self.new_from_filename(song_file)
        song_file.save
        song_file        
    end

    def self.new_from_filename(name)
        s_name = name.split(" - ")[1]
        a_name = name.split(" - ")[0]
        g_name = name.split(" - ")[2].chomp(".mp3")
        song = self.find_or_create_by_name(s_name)
        song.artist = Artist.find_or_create_by_name(a_name)
        song.genre = Genre.find_or_create_by_name(g_name)
        song
    end


    




end
