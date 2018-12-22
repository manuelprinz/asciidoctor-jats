require 'rspec'

require 'asciidoctor'
require 'asciidoctor-jats'

RSpec.describe Asciidoctor::JATS::Entity::Subscript do
  context '#to_s' do
    it 'should wrap a word in <sub> tags' do
      actual = build_subscript('Example').to_s
      expected = '<sub>Example</sub>'
      expect(actual).to eq(expected)
    end

    it 'should wrap a phrase in <sub> tags' do
      actual = build_subscript('This is an example.').to_s
      expected = '<sub>This is an example.</sub>'
      expect(actual).to eq(expected)
    end
  end

  private

  def build_subscript(text)
    node = Asciidoctor::Inline.new(nil, :subscript, text)
    described_class.new(node)
  end
end
