require 'rspec'

require 'asciidoctor'
require 'asciidoctor-jats'

RSpec.describe Asciidoctor::JATS::Entity::Monospace do
  context '#to_s' do
    it 'should wrap a word in <monospace> tags' do
      actual = build_monospaced('Example').to_s
      expected = '<monospace>Example</monospace>'
      expect(actual).to eq(expected)
    end

    it 'should wrap a phrase in <monospace> tags' do
      actual = build_monospaced('This is an example.').to_s
      expected = '<monospace>This is an example.</monospace>'
      expect(actual).to eq(expected)
    end
  end

  private

  def build_monospaced(text)
    node = Asciidoctor::Inline.new(nil, :monospaced, text)
    described_class.new(node)
  end
end
