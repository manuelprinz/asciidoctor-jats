module Asciidoctor
  module JATS
    module Entity
      class Term < SingleTag
        def initialize(node)
          @node = node
        end

        attr_reader :node

        def content
          node.map(&:text).first
        end

        def tag_name
          'term'
        end
      end
    end
  end
end
