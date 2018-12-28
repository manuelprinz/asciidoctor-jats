module Asciidoctor
  module JATS
    module Entity
      # Bold text. Wraps some content into +bold+ tags.
      class Bold < SingleTag
        # Create a new [Bold].
        # @param node [Asciidoctor::Inline] an inline block
        def initialize(node)
          @text = node.text
        end

        # @return [] the text of the block
        def content
          @text
        end

        # @return [String] the tag +<bold>+
        def tag_name
          'bold'
        end
      end
    end
  end
end
