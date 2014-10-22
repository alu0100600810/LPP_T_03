require "bundler/gem_tasks"

task :default=> :spec

desc "Run RSpec code example"
task :spec do
     sh "rspec -I. -Ilib -Ispec spec/LPP_T_3/pregunta_spec.rb"
end

desc "Generar documentación de las pruebas (HTML)"
task :doc_HTML do
     sh "rspec -I. -Ilib -Ispec spec/LPP_T_3/pregunta_spec.rb --format html > doc/pruebas/index.html"
end
