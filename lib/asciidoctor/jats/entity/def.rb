module Asciidoctor
  module JATS
    module Entity
      # Definintion of a term. Wraps the definition into +def+ tags.
      class Def < SingleTag
        # Create a new [Def].
        # @param node [Asciidoctor::Inline] an inline block
        def initialize(node)
          @node = node
        end

        attr_reader :node

        # @return [] the text of the block, wrapped in a [Paragraph]
        def content
          Paragraph.new(content: node.text)
        end

        # @return [String] the tag +<def>+
        def tag_name
          'def'
        end
      end
    end
  end
end
