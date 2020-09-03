module Concerns::Findable

  def ClassMethods
    def find_by_name(name)
      @@all.find{|item| item.name == name}
    end
  end
    
end