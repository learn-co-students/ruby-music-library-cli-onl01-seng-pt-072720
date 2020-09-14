class Song
    attr_accessor :name, :artist, :genre

    @@all = [] 

    def initialize(name, artist = nil, genre = nil )
        @name = name
        self.artist=(artist) if artist != nil 
        self.genre=(genre) if genre != nil 
    end

    def self.all
        @@all 
    end

    def self.destroy_all
        @@all.clear
    end

    def save 
        @@all << self
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        if genre.songs.include?(self) == false
            genre.songs << self 
        end 
    end

    def self.find_by_name(name)
        self.all.find {|song|song.name == name}
    end

    def self.find_or_create_by_name(name)
        find = self.find_by_name(name)
        if find == nil
            self.create(name)
        else find
        end
    end

end