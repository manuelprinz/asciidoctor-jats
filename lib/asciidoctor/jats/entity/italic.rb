module Asciidoctor
  module JATS
    module Entity
      class Italic < SingleTag
        def initialize(node)
          @text = node.text
        end

        def tag_name
          'italic'
        end

        def content
          @text
        end
      end
    end
  end
end
