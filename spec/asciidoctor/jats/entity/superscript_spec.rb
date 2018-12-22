require 'rspec'

require 'asciidoctor'
require 'asciidoctor-jats'

RSpec.describe Asciidoctor::JATS::Entity::Superscript do
  context '#to_s' do
    it 'should wrap a word in <sup> tags' do
      actual = build_superscript('Example').to_s
      expected = '<sup>Example</sup>'
      expect(actual).to eq(expected)
    end

    it 'should wrap a phrase in <sup> tags' do
      actual = build_superscript('This is an example.').to_s
      expected = '<sup>This is an example.</sup>'
      expect(actual).to eq(expected)
    end
  end

  private

  def build_superscript(text)
    node = Asciidoctor::Inline.new(nil, :superscript, text)
    described_class.new(node)
  end
end
