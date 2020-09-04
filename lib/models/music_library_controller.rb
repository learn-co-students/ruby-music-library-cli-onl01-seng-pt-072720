class MusicLibraryController

    attr_accessor :path 

    def initialize(path = "./db/mp3s")
        @path = path
        new_object = MusicImporter.new(path)
        new_object.import
    end

    def call
        user_input = "" 
        while user_input != "exit"
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
            user_input = gets.strip 
            if user_input == 'list songs'
                list_songs
            elsif user_input == 'list artists'
                list_artists
            elsif user_input == 'list genres'
                list_genres
            elsif user_input == "list artist"
                list_songs_by_artist 
            elsif user_input == 'list genre'
                list_songs_by_genre
            elsif user_input == 'play song'
                play_song
            end
        end
    end

    def list_songs
        Song.all.sort {|a,b| a.name <=> b.name}.each.with_index do |song, i|
            puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        Artist.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |artist, i|
            puts "#{i}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |genre, i|
        puts "#{i}. #{genre.name}"
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets.strip
        if genre = Genre.find_by_name(user_input)
            genre.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |song, i|
                puts "#{i}. #{song.artist.name} - #{song.name}"
            end
        end

    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.strip
        if artist = Artist.find_by_name(user_input)
            artist.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |song,i|
                puts "#{i}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def play_song 
        puts "Which song number would you like to play?"
        user_input = gets.strip.to_i 
        if (1..Song.all.length).include?(user_input)
            songs = Song.all.sort{|a,b| a.name <=> b.name}
            selected = songs[user_input - 1]
            puts "Playing #{selected.name} by #{selected.artist.name}"
        end

    end

end
