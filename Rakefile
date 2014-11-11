# encoding: utf-8
$:.unshift File.dirname(__FILE__) + 'lib'
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default=> :spec

desc "Generar documentación de las pruebas (HTML)"
task :doc_HTML do
     sh "rspec -I. -Ilib -Ilib/examen -Ispec spec/examen_spec.rb --format html > doc/pruebas/index.html"
end

desc "Generar documentación de las pruebas"
task :doc do
     sh "rspec -I. -Ilib -Ilib/examen -Ispec spec/examen_spec.rb --format documentation"
end

