module Asciidoctor
  module JATS
    class Paragraph
      attr_reader :content

      def initialize(node)
        @content = node.content
      end

      def to_s
        "<p>#{content}</p>"
      end
    end

    class Emphasis
      attr_reader :text

      def initialize(node)
        @text = node.text
      end

      def to_s
        if text.empty?
          ''
        else
          "<italic>#{text}</italic>"
        end
      end
    end

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
