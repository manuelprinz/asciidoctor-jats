module Asciidoctor
  module JATS
    module Entity
      class DefList
        def initialize(node)
          @node = node
        end

        attr_reader :node

        def to_s
          %(<def-list>#{title}#{list_items}</def-list>)
        end

        private

        def list_items
          result = []
          node.items.map do |term, definition|
            result << '<def-item>'
            result << Term.new(term)
            result << Def.new(definition)
            result << '</def-item>'
          end
          result.join LF
        end

        def title
          node.title? ? "<title>#{node.title}</title>" : ''
        end
      end
    end
  end
end
