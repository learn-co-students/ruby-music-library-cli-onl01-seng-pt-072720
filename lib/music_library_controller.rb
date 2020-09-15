class MusicLibraryController

require 'pry'

    attr_accessor :path
    
    def initialize(path = "./db/mp3s")
        @path = path 
        MusicImporter.new(path).import
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
            
        input = gets.chomp
        
        case input
            when 'list songs'
                self.list_songs
            when 'list artists'
                self.list_artists
            when 'list genres'
                self.list_genres
            when 'list artist'
                self.list_songs_by_artist
            when 'list genre'
                self.list_songs_by_genre
            when 'play song'
                self.play_song
            when 'exit'
                'exit'
            else
                call
            end
        end
    
    def list_songs
        song_array = Song.all.sort do |a, b|
             a.name <=> b.name
        end
        song_array.each_with_index do |song, i|
            puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        artist_array = Artist.all.sort do |a, b|
            a.name <=> b.name
        end
        artist_array.each_with_index do |artist, i|
           puts "#{i+1}. #{artist.name}"
       end
    end


    def list_genres
        genre_array = Genre.all.sort do |a, b|
            a.name <=> b.name
        end
        genre_array.each_with_index do |genre, i|
           puts "#{i+1}. #{genre.name}"
       end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        
        if artist = Artist.find_by_name(input) 
            alphabetized_songs = artist.songs.sort do |a, b| 
                a.name <=> b.name
            end
            alphabetized_songs.each_with_index do |song, i|
            puts "#{i+1}. #{song.name} - #{song.genre.name}"
        end
    end 
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        
        if genre = Genre.find_by_name(input) 
            alphabetized_genres = genre.songs.sort do |a, b| 
                a.name <=> b.name
            end
            alphabetized_genres.each_with_index do |song, i|
            puts "#{i+1}. #{song.artist.name} - #{song.name}"
        end
    end 
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
        if input > 0 && input <= Song.all.length
            array = Song.all.sort{|a,b| a.name <=> b.name}
            song = array[input-1]
        puts "Playing #{song.name} by #{song.artist.name}"
        end
    end

    
end
