require 'asciidoctor/jats/version'

module Asciidoctor
  module JATS
    class Converter
      include Asciidoctor::Converter

      register_for 'jats'

      def initialize(backend, opts = nil)
        super
        outfilesuffix 'jats'
      end

      def convert(node, transform = nil, _opts = nil)
        if respond_to?(transform ||= node.node_name)
          send transform, node
        else
          warn %(asciidoctor: WARNING: conversion missing in JATS backend for #{transform})
        end
      end

      DOCUMENT_HEADER = <<~END_OF_HEADER
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE article PUBLIC "-//NLM//DTD JATS (Z39.96) Article Authoring DTD v1.0 20120330//EN"
          "JATS-articleauthoring1.xsd">
      END_OF_HEADER

      def document(node)
        result = []
        root_tag_name = 'article'
        result << DOCUMENT_HEADER
        result << %(<#{root_tag_name}>)
        if node.header?
          result << %(<front>)
          result << %(<article-meta>)
          result << document_title(node.doctitle)
          result << %(<contrib-group><contrib/></contrib-group>)
          result << %(<abstract/>)
          result << %(</article-meta>)
          result << %(</front>)
        end
        result << %(<body>)
        result << node.content if node.blocks?
        result << %(</body>)
        result << %(</#{root_tag_name}>)
        result.join LF
      end

      def embedded(node)
        node.content
      end

      def inline_quoted(node)
        Entity::Inline.for(node)
      end

      def olist(node)
        Entity::List.new(node, :order)
      end

      def paragraph(node)
        Entity::Paragraph.new(node)
      end

      def section(node)
        result = []
        attrs = {}
        attrs['id'] = node.id unless node.id.start_with? '_'
        result << tag_with_attrs('sec', attrs)
        result << wrap(node.title, within: 'title')
        result << node.content
        result << %(</sec>)
        result.join ' '
      end

      def ulist(node)
        Entity::List.new(node, :bullet)
      end

      private

      def document_title(title)
        %(<title-group><article-title>#{title}</article-title></title-group>)
      end

      def tag_with_attrs(tag, attrs = {})
        result = []
        result << %(<#{tag})
        attrs.each do |key, value|
          result << %(#{key}="#{value}")
        end
        result << '>'
        result.join ' '
      end

      def wrap(content, within: '')
        "<#{within}>#{content}</#{within}>"
      end
    end
  end
end
