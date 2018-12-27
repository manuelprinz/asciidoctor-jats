module Asciidoctor
  module JATS
    module Entity
      class Paragraph < SingleTag
        def initialize(content:)
          @content = content
        end

        attr_reader :content

        def tag_name
          'p'
        end
      end
    end
  end
end
