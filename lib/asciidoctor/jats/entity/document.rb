module Asciidoctor
  module JATS
    module Entity
      class Document
        def initialize(node, type = Article)
          @document = type.new(node)
        end

        attr_reader :document

        def to_s
          header +
            "<#{document.root_element}>" +
            document.front_matter +
            document.body +
            "</#{document.root_element}>"
        end

        private

        def header
          <<~END_OF_HEADER
            <?xml version="1.0" encoding="UTF-8"?>
            <!DOCTYPE article PUBLIC "-//NLM//DTD JATS (Z39.96) Article Authoring DTD v1.0 20120330//EN"
              "JATS-articleauthoring1.xsd">
          END_OF_HEADER
        end
      end
    end
  end
end
