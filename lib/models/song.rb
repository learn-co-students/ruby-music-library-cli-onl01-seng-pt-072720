class Song

    extend Concerns::Findable  
    attr_accessor :name, :artist, :genre
    
    @@all = []


    def initialize(name, artist = nil, genre = nil)
        @name = name 
        @artist= artist
        if artist != nil 
            self.artist=(artist)
        end
        if genre != nil 
            self.genre=(genre) 
        end
        save 
    end
    
    def self.all
        @@all
    end
    
    def save
        self.class.all << self 
    end
    
    def self.destroy_all 
        @@all.clear
    end
    
    def self.create(name)
        new_song = self.new(name) 
        new_song 
    end

    def find_by_name 
        Song.all.select{|song| song == self}
    end

    def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
    end


    def genre=(genre)
        @genre = genre 
        if self.genre.songs.include?(self) == false 
        self.genre.songs << self 
        end
    end

    #def self.find_by_name(name)
     #   Song.all.find{|song| song.name == name}
    #end

    #def self.find_or_create_by_name(name)
        #if self.find_by_name(name) == nil 
            #self.create(name)
        #else 
            #self.find_by_name(name)
       # end
   # end

    def self.new_from_filename(filename)
        splitfile = filename.split(" - ")
        artist = Artist.find_or_create_by_name(splitfile[0])
        genre = Genre.find_or_create_by_name(splitfile[2].chomp(".mp3"))
        self.new(splitfile[1], artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end



    
end