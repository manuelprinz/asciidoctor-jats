module Asciidoctor
  module JATS
    module Entity
      class Content
        def initialize(node)
          @node = node
        end

        def to_s
          @node.text
        end
      end
    end
  end
end
