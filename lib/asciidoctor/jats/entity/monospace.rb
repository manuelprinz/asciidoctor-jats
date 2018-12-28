module Asciidoctor
  module JATS
    module Entity
      # Monospace text. Wraps some content into +monospace+ tags.
      class Monospace < SingleTag
        # Create a new [Monospace].
        # @param node [Asciidoctor::Inline] an inline block
        def initialize(node)
          @text = node.text
        end

        # @return [] the text of the block
        def content
          @text
        end

        # @return [String] the tag +<monospace>+
        def tag_name
          'monospace'
        end
      end
    end
  end
end
