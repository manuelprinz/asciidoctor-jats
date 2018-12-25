require 'rspec'

require 'asciidoctor'
require 'asciidoctor-jats'

RSpec.describe Asciidoctor::JATS::Entity::Bold do
  context '#to_s' do
    it 'should wrap a word in <bold> tags' do
      actual = build_strong('Example').to_s
      expected = '<bold>Example</bold>'
      expect(actual).to eq(expected)
    end

    it 'should wrap a phrase in <bold> tags' do
      actual = build_strong('This is an example.').to_s
      expected = '<bold>This is an example.</bold>'
      expect(actual).to eq(expected)
    end
  end

  private

  def build_strong(text)
    node = Asciidoctor::Inline.new(nil, :strong, text)
    described_class.new(node)
  end
end
