module Asciidoctor
  module JATS
    module Entity
      class Monospace < SingleTag
        def initialize(node)
          @text = node.text
        end

        def tag_name
          'monospace'
        end

        def content
          @text
        end
      end
    end
  end
end
