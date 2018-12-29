module Asciidoctor
  module JATS
    module Entity
      # Subscript text. Wraps some content into +sub+ tags.
      class Subscript < SingleTag
        # Create a new [Subscript].
        # @param node [Asciidoctor::Inline] an inline block
        def initialize(node)
          @text = node.text
        end

        # @return [] the text of the block
        def content
          @text
        end

        # @return [String] the tag +<sub>+
        def tag_name
          'sub'
        end
      end
    end
  end
end
