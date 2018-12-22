module Asciidoctor
  module JATS
    module Entity
      class Strong
        attr_reader :text

        def initialize(node)
          @text = node.text
        end

        def to_s
          if text.empty?
            ''
          else
            "<bold>#{text}</bold>"
          end
        end
      end
    end
  end
end
