 class Genre
  
    extend Concerns::Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
   @@all = []
  attr_accessor :name, :songs
  
  
  def initialize
    save
  end
  
    
  
  
end