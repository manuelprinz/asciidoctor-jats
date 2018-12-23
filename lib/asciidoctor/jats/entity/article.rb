module Asciidoctor
  module JATS
    module Entity
      class Article
        def initialize(node)
          @node = node
        end

        attr_reader :node

        def root_element
          'article'
        end

        def front_matter
          %(<front><article-meta>) + title + contributions + abstract + %(</article-meta></front>)
        end

        def body
          %(<body>#{content}</body>)
        end

        private

        def abstract
          %(<abstract/>)
        end

        def content
          node.content if node.blocks?
        end

        def contributions
          %(<contrib-group><contrib/></contrib-group>)
        end

        def title
          %(<title-group><article-title>#{node.title}</article-title></title-group>)
        end
      end
    end
  end
end
