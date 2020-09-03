require 'pry'
class MusicLibraryController

    def initialize(the_path = './db/mp3s')
        MusicImporter.new(the_path).import

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
        gets.chomp

        gets until gets == 'exit'
    end

    def list_songs
        Song.all.sort_by { |s| s.name }.each_with_index { |obj, i| puts "#{i+1}. #{obj.artist.name} - #{obj.name} - #{obj.genre.name}" }
    end

    def list_artists
        Artist.all.sort_by { |s| s.name }.each_with_index { |obj, i| puts "#{i+1}. #{obj.name}" }
    end

    def list_genres
        Genre.all.sort_by { |s| s.name }.each_with_index { |obj, i| puts "#{i+1}. #{obj.name}" }
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets
        artist_instance = Artist.find_by_name(artist_name)
        artist_instance.songs.sort_by { |s| s.name }.each_with_index { |song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}" } if artist_instance.class == Artist
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets
        genre_instance = Genre.find_by_name(genre_name)
        genre_instance.songs.sort_by { |s| s.name }.each_with_index { |song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}" } if genre_instance.class == Genre
    end

    def play_song
        puts "Which song number would you like to play?"
        song_number = gets
        index_number = song_number.to_i - 1 
        song_to_play = list_songs.map[index_number].split(" ")
        puts "Playing #{song_to_play[3]} by #{song_to_play[1]}"
        # ["num.[0]", "song.artist.name[1]", "-[2]", "song.name[3]", "-[4]", "song.genre.name[5]"]
        # puts "Playing #{song_name} by #{artist_name}"
    end
    # binding.pry
end