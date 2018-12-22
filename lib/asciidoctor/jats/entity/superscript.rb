module Asciidoctor
  module JATS
    module Entity
      class Superscript < SingleTag
        def initialize(node)
          @text = node.text
        end

        def tag_name
          'sup'
        end

        def content
          @text
        end
      end
    end
  end
end
