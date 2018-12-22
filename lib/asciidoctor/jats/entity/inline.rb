module Asciidoctor
  module JATS
    module Entity
      class Inline
        def self.for(node)
          case node.type
          when :emphasis
            Emphasis
          when :strong
            Strong
          when :monospaced
            Monospace
          when :superscript
            Superscript
          when :subscript
            Subscript
          else
            NoEntity
          end.new(node)
        end
      end
    end
  end
end
