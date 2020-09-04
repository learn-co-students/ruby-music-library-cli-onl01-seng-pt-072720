class MusicLibraryController 
  attr_accessor :path
  

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    input = nil 
    
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
       
      def list_songs
        sorted = Song.all.sort{|a, b| a.name <=> b.name }
        sorted.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
      end 
      
      def list_artists
        Artist.all.sort{|a, b| a.name <=> b.name }.each_with_index{|a, i| puts "#{i+1}. #{a.name}"}
      end 
      
      def list_genres
        Genre.all.sort{|a, b| a.name <=> b.name }.each_with_index{|g, i| puts "#{i+1}. #{g.name}"}
      end 
      
      def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        if artist = Artist.find_by_name(input)
          artist.songs.sort{ |a, b| a.name <=> b.name }.each_with_index{|s, i| puts "#{i+1}. #{s.name} - #{s.genre.name}"}
        end
      end 
      
      def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        if genre = Genre.find_by_name(input)
          genre.songs.sort{ |a, b| a.name <=> b.name }.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name}"}
        end
      end 
      
      def play_song 
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
        if input > 0 && input <= Song.all.length 
          song = Song.all.sort{|a,b| a.name <=> b.name}[input -1]
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
      
      input = gets.strip
      
      case input
        when "list songs"
          list_songs 
        when "list artists"
          list_artists 
        when 'list artist'
          list_songs_by_artist
        when 'list genre'
          list_songs_by_genre
        when 'play song'
          play_song
      end
      
    end
      
      
    # if input == 'exit'
    #   exit
    # else 
    #   if input == 'list songs'
    #     list_songs
    #   elsif input =='list artists'
    #     list_artists
    #   elsif input == 'list genres'
    #     list_genres
    #   elsif input == 'list artist'
    #     list_songs_by_artist
    #   elsif input == 'list genre'
    #     list_songs_by_genre 
    #   elsif input == 'play song'
    #     play_song
    #   else 
    #     exit
    #   end
    # end
      

  #   until input = exit do
      
  #     case input 
  #       when 'list songs'
  #         Song.all.name
  #       when 'list artists'
  #         Artist.all.name 
  #       when 'list genres'
  #         Genre.all.name 
  #       when 'play song'
  #         #play_song 
  #     end
  #   end
  #   #   
  #   # end
  end 
  
  
  
end
