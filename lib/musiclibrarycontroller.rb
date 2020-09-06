class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets.chomp
    case user_input
    when "list songs"
      self.list_songs
    when "list artists"
      self.list_artists
    when "list genres"
      self.list_genres
    when "list artist"
      self.list_songs_by_artist
    when "list genre"
      self.list_songs_by_genre
    when "play song"
      self.play_song
    when "exit"
      'exit'
    else
      call
    end
  end 
  
  def list_songs
    counter = 1
    new_list = Song.all.sort_by do |song|
        song.name
      end
    new_list.each do |song_name|
      puts "#{counter}. #{song_name.artist.name} - #{song_name.name} - #{song_name.genre.name}"
      counter += 1
    end
      
  end
  
  def list_artists
    counter = 1
    new_list = Artist.all.sort_by do |artist|
        artist.name
      end
    new_list.each do |artist_name|
      puts "#{counter}. #{artist_name.name}"
      counter += 1
    end
  end
  
  def list_genres
    counter = 1
    new_list = Genre.all.sort_by do |genre|
        genre.name
      end
    new_list.each do |genre_name|
      puts "#{counter}. #{genre_name.name}"
      counter += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
    songs = Song.all

    if (1..songs.length).include?(user_input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[user_input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
  
  
end