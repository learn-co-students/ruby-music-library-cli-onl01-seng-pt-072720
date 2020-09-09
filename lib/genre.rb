class Genre
    @@all = []
    extend Concerns::Findable
        attr_accessor :name, :songs
        
        
        def initialize(name)
            @name = name
            @songs = []
            
        end
    
    
        def self.all
            @@all
        end
    
        def save
            @@all << self
        end
    
        def self.create(name)
            new_genre = new(name)
            new_genre.save
            new_genre
        end
    
        def self.destroy_all
            @@all = []
        end

        def songs
            @songs
        end

        

        def artists
            @new_array = []
            @songs.each do |song|
              if @new_array.include?(song.artist)
                nil
              else
                @new_array << song.artist
              end
            end
            @new_array
          end
    
    end