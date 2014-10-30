require "bundler/gem_tasks"

task :default=> :spec

desc "Run RSpec code example"
task :spec do
     sh "rspec -I. -Ilib -Ilib/examen -Ispec spec/examen_spec.rb"
end

desc "Generar documentación de las pruebas (HTML)"
task :doc_HTML do
     sh "rspec -I. -Ilib -Ilib/examen -Ispec spec/examen_spec.rb --format html > doc/pruebas/index.html"
end

desc "Generar documentación de las pruebas"
task :doc do
     sh "rspec -I. -Ilib -Ilib/examen -Ispec spec/examen_spec.rb --format documentation"
end

