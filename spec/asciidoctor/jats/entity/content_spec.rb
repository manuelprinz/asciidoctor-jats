require 'rspec'

require 'asciidoctor'
require 'asciidoctor-jats'

RSpec.describe Asciidoctor::JATS::Entity::Content do
  context '#to_s' do
    it 'should return a word as is' do
      actual = build('Example').to_s
      expected = 'Example'
      expect(actual).to eq(expected)
    end

    it 'should return a phrase as is' do
      actual = build('This is an example.').to_s
      expected = 'This is an example.'
      expect(actual).to eq(expected)
    end
  end

  private

  def build(text)
    node = Asciidoctor::Inline.new(nil, :irrelevant, text)
    described_class.new(node)
  end
end
