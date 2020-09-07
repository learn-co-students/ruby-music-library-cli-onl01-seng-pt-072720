module Concerns
    module Findable
        def find_by_name(name)
            all.detect { | a | a.name == name }
        end

        def find_or_create_by_name(name)
            if find_by_name(name) == nil
              return create(name)
            else
              return find_by_name(name)
            end
          end
    end
end