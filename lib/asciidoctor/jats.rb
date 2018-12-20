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
          result << %(<title-group>)
          result << wrap(node.doctitle, within: 'article-title')
          result << %(</title-group>)
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

      (QUOTE_TAGS = {
        emphasis: 'italic',
        strong: 'bold',
        monospaced: 'monospace',
        superscript: 'sup',
        subscript: 'sub'
      }.freeze)

      def inline_quoted(node)
        tag = QUOTE_TAGS[node.type]
        if tag
          wrap(node.text, within: tag)
        else
          node.text
        end
      end

      def olist(node)
        render_list(node, 'order')
      end

      def paragraph(node)
        wrap(node.content, within: :p)
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
        render_list(node, 'bullet')
      end

      private

      def render_list(node, list_type)
        attrs = {'list-type': list_type}
        result = []
        attrs['id'] = node.id if node.id
        result << tag_with_attrs('list', attrs)
        result << wrap(node.title, within: :title) if node.title?
        result << render_list_items(node.items)
        result << '</list>'
        result.join LF
      end

      def render_list_items(items)
        result = []
        items.each do |item|
          result << '<list-item>'
          result << wrap(item.text, within: :p)
          result << '</list-item>'
        end
        result.join ''
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
