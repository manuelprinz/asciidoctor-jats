require 'asciidoctor'
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
        # This needs explicit conversion to String as Nokogiri tries to send messages to it
        Entity::Document.new(node).to_s
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
        Entity::Section.new(node)
      end

      def ulist(node)
        Entity::List.new(node, :bullet)
      end
    end
  end
end
