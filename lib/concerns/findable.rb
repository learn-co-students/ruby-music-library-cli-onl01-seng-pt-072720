module Concerns::Findable
  
  def ClassMethod
    def self.find_by_name(name)
      @@all.find{|item| item.name == name}
    end
  end
    
end