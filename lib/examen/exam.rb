# coding: utf-8
require "lista"
# Clase gestora de examenes con preguntas
class Exam
  attr_accessor :list
  # Crea una instancia de la clase Exam , a partir de una pregunta.
  def initialize(p)
    @list = Lista.new(p)
  end
  # Definición del Metotodo to_s, para la clase Exam.
  def to_s
    "#{@list}"
  end
  # Sobrecarga del operador << para insertar preguntas al final del Examen.
  def <<(p)    
     @list << p
  end 
  # Inserta una o varias preguntas sucesivamente.
  def push_back(*preguntas)
    preguntas.each { |p| @list << p}
    preguntas
  end 

end
