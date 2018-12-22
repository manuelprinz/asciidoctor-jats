require 'rspec'

require 'asciidoctor'
require 'asciidoctor/jats/entity/emphasis'

RSpec.describe Asciidoctor::JATS::Entity::Emphasis do
  context '#to_s' do
    it 'should wrap a word in <italic> tags' do
      actual = build_emphasis('Example').to_s
      expected = '<italic>Example</italic>'
      expect(actual).to eq(expected)
    end

    it 'should wrap a phrase in <italic> tags' do
      actual = build_emphasis('This is an example.').to_s
      expected = '<italic>This is an example.</italic>'
      expect(actual).to eq(expected)
    end
  end

  private

  def build_emphasis(text)
    node = Asciidoctor::Inline.new(nil, :emphasis, text)
    described_class.new(node)
  end
end
