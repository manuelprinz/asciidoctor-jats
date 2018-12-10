require 'asciidoctor/jats/version'

module Asciidoctor
  module JATS
    class Converter
      include Asciidoctor::Converter

      register_for 'jats'

      def initialize(backend, opts = nil)
        super
      end

      def convert(node, transform = nil, _opts = nil)
        if respond_to?(transform ||= node.node_name)
          send transform, node
        else
          warn %(asciidoctor: WARNING: conversion missing in JATS backend for #{transform})
        end
      end

      def embedded(node)
        node.content
      end

      def paragraph(node)
        %(<p>#{node.content}</p>)
      end
    end
  end
end