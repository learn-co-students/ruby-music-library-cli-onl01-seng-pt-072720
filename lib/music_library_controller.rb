require 'pry'

class MusicLibraryController
    
    def initialize(path = "./db/mp3s")
        new_import = MusicImporter.new(path)
        new_import.import
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
        when "lists artist"
            self.list_songs_by_artist
        when "list genre"
            self.lists_songs_by_genre
        when "play song"
            self.play_song
        when "exit"
            'exit'
        else
            call
        end
    end

    def list_songs
        Song.all.sort_by {|a| a.name}.each_with_index do |song, i|
            puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        artists = Artist.all.sort{|a, b| a.name <=> b.name}
        artists.each_with_index{|artist, i| puts "#{i+1}. #{artist.name}"}
    end

    def list_genres
        genres = Genre.all.sort{|a, b| a.name <=> b.name}
        genres.each_with_index{|genre, i| puts "#{i+1}. #{genre.name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip

        if artist = Artist.find_by_name(input)
            artist.songs.uniq.sort{|a, b| a.name <=> b.name}.each_with_index do |song, i|
                puts "#{i+1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip

        if genre = Genre.find_by_name(input)
            genre.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |song, i|
                puts "#{i+1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    #def play_song
    #    puts "Which song number would you like to play?"
    #    s_num = gets.strip
    #    input = s_num.to_i - 1
    #    #binding.pry
    #    if (input >= 0) && (input <= (Song.all.length - 1))
    #      song_to_play = Song.all.uniq.sort_by{|song| song.name }[input-1]#uniq.sort{|a, b| a.name <=> b.name}
    #      #binding.pry
    #      #song = song_list[input-1]
    #      #name = Artist.all.sort{|a, b| a.name <=> b.name}
    #      puts "Playing #{song_to_play.name} by #{song_to_play.artist.name}"
    #    else
    #        nil
    #    end
    #end

    def play_song
        puts "Which song number would you like to play?"
        song_number = gets.strip
        index_number = song_number.to_i - 1 
        if index_number.between?(0, Song.all.length-1)
            song_to_play = Song.all.sort_by { |s| s.name }[index_number]
            puts "Playing #{song_to_play.name} by #{song_to_play.artist.name}"
        end
    end

end