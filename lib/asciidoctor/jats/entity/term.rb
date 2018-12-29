module Asciidoctor
  module JATS
    module Entity
      # Term of a definition. Wraps the term into +term+ tags.
      class Term < SingleTag
        # Create a new [Term].
        # @param node [Array] of [Asciidoctor::Inline] blocks
        def initialize(node)
          @node = node
        end

        attr_reader :node

        # @return [] the text of the first block
        def content
          node.map(&:text).first
        end

        # @return [String] the tag +<term>+
        def tag_name
          'term'
        end
      end
    end
  end
end
