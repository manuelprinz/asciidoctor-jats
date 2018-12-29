require 'bundler/gem_tasks'
require 'rake/testtask'
require 'yard'

require 'asciidoctor/doctest'
require 'asciidoctor-jats'

Rake::TestTask.new(:minitest) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

DocTest::RakeTasks.new(:doctest) do |t|
  t.input_examples :asciidoc, path: [
    *DocTest.examples_path,
    'test/examples/asciidoc'
  ]
  t.output_examples :xml, path: 'test/examples/jats'
  t.converter = DocTest::HTML::Converter
  t.converter_opts = {
    backend_name: :jats,
    converter: Asciidoctor::JATS::Converter,
  }
end

YARD::Rake::YardocTask.new

task default: :minitest
