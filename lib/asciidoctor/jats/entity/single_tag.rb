module Asciidoctor
  module JATS
    module Entity
      # @abstract  Base class for content that is wrapped by a single XML element.
      # Subclass and override to implement a new entity/element class.
      class SingleTag
        # The tag name.
        # @raise [NotImplementedError]
        def tag_name
          raise NotImplementedError
        end

        # The content to be wrapped.
        # @raise [NotImplementedError]
        def content
          raise NotImplementedError
        end

        # A string representation of the tag and content.
        # @return [String] the +content+, wrapped in the tag provided by +tag_name+
        def to_s
          "<#{tag_name}>#{content}</#{tag_name}>"
        end
      end
    end
  end
end
