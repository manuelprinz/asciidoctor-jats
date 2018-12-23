module Asciidoctor
  module JATS
    module Entity
      class List
        def initialize(node, type = nil)
          @node = node
          @type = type
        end

        attr_reader :node

        def id_attr
          node.id ? %(id="#{node.id}") : ''
        end

        def title
          node.title ? %(<title>#{node.title}</title>) : ''
        end

        def type_attr
          @type ? %(list-type="#{@type}") : ''
        end

        def list_items
          node.items.map { |item| "<list-item><p>#{item.text}</p></list-item>" }.join('')
        end

        def to_s
          %(<list #{id_attr} #{type_attr}">#{title}#{list_items}</list>)
        end
      end
    end
  end
end
