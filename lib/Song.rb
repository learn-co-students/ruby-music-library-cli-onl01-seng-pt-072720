class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end


  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end


  def self.find_by_name(name)
    self.all.detect {|temp| temp.name == name}
  end


  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end


  def self.new_from_filename(filename)
    raw_data = filename.split(".mp3").shift
    data = raw_data.split(" - ")
    artist = data[0]
    name = data[1]
    genre = data[2]

    new_song = self.new(name)
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)

    new_song.artist = artist
    new_song.genre = genre
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
  end


end
