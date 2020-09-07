class MusicLibraryController

    def initialize(path = "./db/mp3s")
        musicImporter = MusicImporter.new(path)
        musicImporter.import
    end

    def call
        input = ""
        until input == "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"

            input = gets

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
        Song.all.sort! do | a, b |
            a.name <=> b.name
        end

        Song.all.each_with_index do | song, index |
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        Artist.all.sort! do | a, b |
            a.name <=> b.name
        end

        Artist.all.each_with_index do | artist, index |
            puts "#{index + 1}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort! do | a, b |
            a.name <=> b.name
        end

        Genre.all.each_with_index do | genre, index |
            puts "#{index + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets

        if artist = Artist.find_by_name(input)
            artist.songs.sort! do | a, b |
                a.name <=> b.name
            end
            artist.songs.each_with_index do | song, index |
                puts "#{index + 1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets

        if genre = Genre.find_by_name(input)
            genre.songs.sort! do | a, b |
                a.name <=> b.name
            end
            genre.songs.each_with_index do | song, index |
                puts "#{index + 1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    # def play_song
    #     puts "Which song number would you like to play?"
    #     input = gets

    #     Song.all.sort! do | a, b |
    #         a.name <=> b.name
    #     end

    #     Song.all.each_with_index do | song, index |
    #         if input == index + 1
    #             puts "Playing #{song.name} by #{song.artist.name}"
    #         end
    #     end
    # end

    def play_song
        puts "Which song number would you like to play?"
        list_of_songs =  Song.all.sort{ |a, b| a.name <=> b.name }
    
        input = gets.to_i
        if (1..Song.all.length).include?(input)
          song = list_of_songs[input - 1]
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
end