class Song
    extend Concerns::Findable 
    extend Persistable::ClassMethods
    extend Nameable::ClassMethods
    include Persistable::InstanceMethods
    attr_accessor :name, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
      @name = name
      if artist != nil
        self.artist = artist
      end
      if genre != nil
        self.genre = genre
      end
    end

    def self.all
      @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
      new_song = self.new(name)
      new_song.save
      new_song
    end

    def self.new_from_filename(filename)
        arr = filename.split(" - ")
        artist_name = arr[0]
        song_title = arr[1]
        genre_name = arr[2].delete_suffix!('.mp3')
        new_artist = Artist.find_or_create_by_name(artist_name)
        new_genre = Genre.find_or_create_by_name(genre_name)
        Song.new(song_title, new_artist, new_genre)
        # ["Thundercat", "For Love I Come", "dance.mp3"]
    # binding.pry
      end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end

    def artist
      @artist
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre
      @genre
    end
    
    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end
  end