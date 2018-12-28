module Asciidoctor
  module JATS
    module Entity
      # A paragraph. Wraps some content into +<p>+ tags.
      class Paragraph < SingleTag
        # Create a new [Paragraph].
        # @param content [] the content to be wrapped.
        def initialize(content:)
          @content = content
        end

        # @return [] the content of the paragraph
        attr_reader :content

        # @return [String] the tag +<p>+
        def tag_name
          'p'
        end
      end
    end
  end
end
