require 'rspec'

require 'asciidoctor'
require 'asciidoctor-jats'

RSpec.describe Asciidoctor::JATS::Entity::Inline do
  context '.for' do
    it 'should return +Emphasis+ class for emphasized text' do
      actual = described_class.for(node_of_type(:emphasis))
      expect(actual).to be_a(Asciidoctor::JATS::Entity::Italic)
    end

    it 'should return +Strong+ class for strong text' do
      actual = described_class.for(node_of_type(:strong))
      expect(actual).to be_a(Asciidoctor::JATS::Entity::Bold)
    end

    it 'should return +Monospace+ class for monospaced text' do
      actual = described_class.for(node_of_type(:monospaced))
      expect(actual).to be_a(Asciidoctor::JATS::Entity::Monospace)
    end

    it 'should return +Superscript+ class for superscript text' do
      actual = described_class.for(node_of_type(:superscript))
      expect(actual).to be_a(Asciidoctor::JATS::Entity::Superscript)
    end

    it 'should return +Subscript+ class for subscript text' do
      actual = described_class.for(node_of_type(:subscript))
      expect(actual).to be_a(Asciidoctor::JATS::Entity::Subscript)
    end

    it 'should return +NoEntity+ class for unknown text' do
      actual = described_class.for(node_of_type(:unsupported_tag))
      expect(actual).to be_a(Asciidoctor::JATS::Entity::NoEntity)
    end
  end

  def node_of_type(type)
    Asciidoctor::Inline.new(nil, :quoted, 'irrelevant', type: type)
  end
end
