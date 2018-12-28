module Asciidoctor
  module JATS
    module Entity
      # Italic text. Wraps some content into +italic+ tags.
      class Italic < SingleTag
        # Create a new [Italic].
        # @param node [Asciidoctor::Inline] an inline block
        def initialize(node)
          @text = node.text
        end

        # @return [String] the tag +<italic>+
        def tag_name
          'italic'
        end

        # @return [] the text of the block
        def content
          @text
        end
      end
    end
  end
end
