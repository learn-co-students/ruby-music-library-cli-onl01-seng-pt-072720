
module Concerns
    module Findable
  
  def self.find_by_name(name)
      self.all.detect{|artist| artist.name == name}
    end
  
  end
end