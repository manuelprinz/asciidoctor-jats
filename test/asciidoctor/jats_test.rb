require "test_helper"

class Asciidoctor::JatsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Asciidoctor::JATS::VERSION
  end
end
