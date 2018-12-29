module Asciidoctor
  module JATS
    module Entity
      # Superscript text. Wraps some content into +sup+ tags.
      class Superscript < SingleTag
        # Create a new [Superscript].
        # @param node [Asciidoctor::Inline] an inline block
        def initialize(node)
          @text = node.text
        end

        # @return [] the text of the block
        def content
          @text
        end

        # @return [String] the tag +<sup>+
        def tag_name
          'sup'
        end
      end
    end
  end
end
