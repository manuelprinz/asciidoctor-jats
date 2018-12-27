module Asciidoctor
  module JATS
    module Entity
      class Footnote
        def initialize(node)
          @node = node
        end

        attr_reader :node

        def to_s
          %(<fn>#{Paragraph.new(content: node.text)}</fn>)
        end
      end
    end
  end
end
