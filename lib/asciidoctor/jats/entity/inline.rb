module Asciidoctor
  module JATS
    module Entity
      class Inline
        def self.for(node)
          case node.type
          when :emphasis
            Emphasis.new(node)
          when :strong
            Strong.new(node)
          when :monospaced
            Monospace.new(node)
          when :superscript
            Superscript.new(node)
          when :subscript
            Subscript.new(node)
          else
            node.text
          end
        end
      end
    end
  end
end
