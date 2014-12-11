# encoding: utf-8
require "exam"
#Clase gestora de un DSL
class Quiz
  attr_accessor :exam, :count, :title
  #Crea una Instancia de la clase Quiz, a partir de un título y un bloque 
  def initialize(title, &block)
    @title = title
    @exam = Exam.new(Pregunta.new(:text => "dummy", :right => "dummy", :distractors => ["dummy"]))
    @exam.list.pop
    @count = 0 
    instance_eval &block
  end 
  #Devuelve el Simbolo :right
  def right
    :right
  end 
  #Devuelve un Array con el Simbolo :wrong y un indice
  def wrong
    @count += 1
    [:wrong, @count]
  end 
  #Actualiza el examen actual, con una nueva pregunta
  def question(*args)
    distract = Array.new
    args[1].keys.each { |x| distract << args[1][x] if x.class.equal? Array }
    exam << Pregunta.new(:text => args[0], :right => args[1][:right], :distractors => distract)
    exam
  end 
  #Definicion del Metodo to_s, para la Clase Quiz
  def to_s
    "\s\s#{@title}\n#{'#' * (@title.size + 4)}\n\n#{@exam}"
  end

end
