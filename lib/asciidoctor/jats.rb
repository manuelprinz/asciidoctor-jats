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

      def document(node)
        result = []
        root_tag_name = 'article'
        result << %(<?xml version="1.0"?>)
        result << %(<#{root_tag_name}>)
        if node.header?
          result << %(<front>)
          result << %(<article-meta>)
          result << %(<title-group>)
          result << %(<article-title>#{node.doctitle}</article-title>)
          result << %(</title-group>)
          result << %(</article-meta>)
          result << %(</front>)
        end
        result << node.content if node.blocks?
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
      })

      def inline_quoted(node)
        tag = QUOTE_TAGS[node.type]
        if tag
          %(<#{tag}>#{node.text}</#{tag}>)
        else
          node.text
        end
      end

      def olist(node)
        render_list(node, 'order')
      end

      def paragraph(node)
        %(<p>#{node.content}</p>)
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
        result << %(<title>#{node.title}</title>) if node.title?
        node.items.each do |item|
          result << '<list-item>'
          result << %(<p>#{item.text}</p>)
          result << '</list-item>'
        end
        result << '</list>'
        result.join LF
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
    end
  end
end
