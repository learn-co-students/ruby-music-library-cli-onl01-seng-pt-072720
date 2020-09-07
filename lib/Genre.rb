class Genre
  attr_accessor :name
  attr_reader :songs

    extend Concerns::Findable

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
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
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect {|temp| temp.artist}.uniq
  end


end
