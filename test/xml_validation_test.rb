require_relative './test_helper'
require 'nokogiri'

# Helper to verify that the examples are valid. All tests are disabled by default.
#
# In order to use it,
#
#   1. download the W3C XML Schema file (in XSD format, see section "Resources" in README for location),
#   2. extract them into "data/schema" (creating a subdirectory named "jats-articleauthoring-xsd-1.0"), and
#   3. remove the "skip_" prefix from the test you would like to run.
#
class XmlValidationTest < Minitest::Test

  def skip_test_that_minimal_example_is_valid_jats
    schema = Nokogiri::XML::Schema(File.new(path_to('JATS-articleauthoring1.xsd')))
    document = Nokogiri::XML(File.read('data/minimal-example.jats'))
    assert_empty schema.validate(document)
  end

  private

  def path_to(filename)
    File.join('data', 'schema', 'jats-articleauthoring-xsd-1.0', filename)
  end

end
