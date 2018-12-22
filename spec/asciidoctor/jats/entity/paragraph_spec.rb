require 'rspec'

require 'asciidoctor'
require 'asciidoctor-jats'

RSpec.describe Asciidoctor::JATS::Entity::Paragraph do
  context '#to_s' do
    it 'should wrap a word in <p> tags' do
      actual = build_paragraph('Example').to_s
      expected = '<p>Example</p>'
      expect(actual).to eq(expected)
    end

    it 'should wrap a phrase in <p> tags' do
      actual = build_paragraph('This is an example.').to_s
      expected = '<p>This is an example.</p>'
      expect(actual).to eq(expected)
    end

    private

    def build_paragraph(text)
      node = Asciidoctor::Block.new(nil, :paragraph, source: text)
      described_class.new(node)
    end
  end
end
