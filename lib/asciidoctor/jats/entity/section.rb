module Asciidoctor
  module JATS
    module Entity
      class Section
        def initialize(node)
          @node = node
        end

        attr_reader :node

        def id_attr
          node.id.start_with?('_') ? '' : %(id="#{node.id}")
        end

        def title
          %(<title>#{node.title}</title>)
        end

        def to_s
          %(<sec #{id_attr}>#{title}#{node.content}</sec>)
        end
      end
    end
  end
end
