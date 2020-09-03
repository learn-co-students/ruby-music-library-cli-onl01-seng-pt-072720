
class Song
  
  extend Concerns::Findable 
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
 
  attr_accessor :name
  
  
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all
  end
  
    
 
    
end