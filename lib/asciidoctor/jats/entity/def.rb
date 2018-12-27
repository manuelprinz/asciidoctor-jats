module Asciidoctor
  module JATS
    module Entity
      class Def < SingleTag
        def initialize(node)
          @node = node
        end

        attr_reader :node

        def content
          Paragraph.new(content: node.text)
        end

        def tag_name
          'def'
        end
      end
    end
  end
end
