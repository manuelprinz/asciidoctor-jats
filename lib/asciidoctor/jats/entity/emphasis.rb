module Asciidoctor
  module JATS
    module Entity
      class Emphasis
        attr_reader :text

        def initialize(node)
          @text = node.text
        end

        def to_s
          if text.empty?
            ''
          else
            "<italic>#{text}</italic>"
          end
        end
      end
    end
  end
end
