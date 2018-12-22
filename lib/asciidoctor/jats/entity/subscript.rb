module Asciidoctor
  module JATS
    module Entity
      class Subscript < SingleTag
        def initialize(node)
          @text = node.text
        end

        def tag_name
          'sub'
        end

        def content
          @text
        end
      end
    end
  end
end
