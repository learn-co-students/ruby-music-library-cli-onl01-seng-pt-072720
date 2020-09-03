class Artist
  
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  
  attr_accessor :name, :songs
  
  
  def initialize
    save
  end
  
  def self.all
    @@all
  end

  
end