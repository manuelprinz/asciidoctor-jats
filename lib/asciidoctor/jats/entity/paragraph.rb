module Asciidoctor
  module JATS
    module Entity
      class Paragraph < SingleTag
        def initialize(node)
          @content = node.content
        end

        attr_reader :content

        def tag_name
          'p'
        end
      end
    end
  end
end
