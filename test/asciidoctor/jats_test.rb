require_relative '../test_helper'
require 'asciidoctor'
require 'nokogiri'

class Asciidoctor::JatsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Asciidoctor::JATS::VERSION
  end

  def test_that_calling_asciidoctor_works
    result = Asciidoctor.convert 'This is a paragraph.', backend: :jats
    refute_empty result, 'Expected Asciidoctor to generate output, but was empty'
  end

  def test_that_empty_document_generates_xml_header
    xml = Asciidoctor.convert '', backend: :jats
    actual = Nokogiri::XML(xml).to_s
    expected = "<?xml version=\"1.0\"?>\n"
    assert_equal actual, expected, 'Expected XML header'
  end

  def test_that_a_paragraph_generates_a_p_element
    xml = Asciidoctor.convert 'This is a paragraph.', backend: :jats
    actual = Nokogiri::XML(xml).to_s
    expected = "<?xml version=\"1.0\"?>\n<p>This is a paragraph.</p>\n"
    assert_equal actual, expected
  end
end
