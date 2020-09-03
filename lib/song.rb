
class Song
  
  extend Concerns::Findable 
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  @@all = []
  attr_accessor :name
  
  
  def initialize(name)
    @name = name
    save
  end
  
  
    
 
    
end