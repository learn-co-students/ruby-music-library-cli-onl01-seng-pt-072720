module Concerns::Findable

    def find_by_name(name)
        self.all.detect{|a| a.name == name}
    end

    def find_or_create_by_name(name)
      find = find_by_name(name)
      if find == nil
          create(name)
      else find
      end
  end
end