module Asciidoctor
  module JATS
    module Entity
      class Footnote
        def initialize(node)
          @node = node
        end

        attr_reader :node

        def to_s
          %(<fn><p>#{node.text}</p></fn>)
        end
      end
    end
  end
end
