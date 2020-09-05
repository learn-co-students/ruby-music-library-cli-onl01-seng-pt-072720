class Genre
  extend Concerns::Findable

  attr_accessor :name, :artists, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def artists
    unique_artists = []
    @songs.each do |song|
      unique_artists << song.artist unless unique_artists.include?(song.artist)
    end
    unique_artists
  end

end
