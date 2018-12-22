module Asciidoctor
  module JATS
    module Entity
      class SingleTag
        def tag_name
          raise NotImplementedError
        end

        def content
          raise NotImplementedError
        end

        def to_s
          "<#{tag_name}>#{content}</#{tag_name}>"
        end
      end
    end
  end
end
