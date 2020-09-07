require 'pry'

class MusicLibraryController
  attr_accessor :path


  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To list all of your songs, enter 'list songs'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"


    input = ""

    until input == "exit"
    input = gets.strip


      case input

      when "list songs"
        list_songs

      when "list artists"
        list_artists

      when "list genres"
        list_genres

      when "list artist"
        list_songs_by_artist

      when "list genre"
        list_songs_by_genre

      when "play song"
        play_song

      end
    end
  end


  def list_songs
    all_songs = Song.all.sort_by {|temp| temp.name}
    all_songs.each_with_index do |element, index|
      puts "#{index+1}. #{element.artist.name} - #{element.name} - #{element.genre.name}"
    end
  end


  def list_artists
    all_artists = Artist.all.sort_by {|temp| temp.name}
    all_artists.each_with_index do |element, index|
      puts "#{index + 1}. #{element.name}"
    end
  end

  def list_genres
    all_genres = Genre.all.sort_by {|temp| temp.name}
    all_genres.each_with_index do |element, index|
      puts "#{index + 1}. #{element.name}"
    end
  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist_songs = Song.all.select {|temp| temp.artist.name == gets}
    artist_songs = artist_songs.sort_by {|temp| temp.name}
    artist_songs.each_with_index do |element, index|
      puts "#{index+1}. #{element.name} - #{element.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre_songs = Song.all.select {|temp| temp.genre.name == gets}
    genre_songs = genre_songs.sort_by {|temp| temp.name}
    genre_songs.each_with_index do |element, index|
      puts "#{index+1}. #{element.artist.name} - #{element.name}"
    end
  end


  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i - 1
    all_songs = Song.all.sort_by {|temp| temp.name}
      if input > 0 && input < Song.all.length
        puts "Playing #{all_songs[input].name} by #{all_songs[input].artist.name}"
      end
  end


end
