module Asciidoctor
  module JATS
    module Entity
      class Bold < SingleTag
        def initialize(node)
          @text = node.text
        end

        def tag_name
          'bold'
        end

        def content
          @text
        end
      end
    end
  end
end
