module Asciidoctor
  module JATS
    module Entity
      class Paragraph
        attr_reader :content

        def initialize(node)
          @content = node.content
        end

        def to_s
          "<p>#{content}</p>"
        end
      end
    end
  end
end