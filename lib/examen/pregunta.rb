# encoding: utf-8
# Clase gestora de una Pregunta de multiples opciones. 
class Pregunta
  attr_accessor :text, :right, :distractors, :difficulty

  include Comparable  
  # Instancia una nueva Pregunta, a partir de un texto, una respuesta correcta, un conjunto de respuestas falsas y opcionalmente la dificultad.
  def initialize(args)
    raise ArgumentError, "Esperada pregunta (:text)" unless args[:text]
    raise ArgumentError, "Esperada respuesta correcta (:right)" unless args[:right]
    raise ArgumentError, "Esperadas respuestas incorrectas (:distractors)" unless args[:distractors]
    @text = args[:text]
    @right = args[:right]
    @distractors = args[:distractors]
    @difficulty = (args.key?:difficulty)?args[:difficulty]:1
  end
  # Definición del Metodo to_s para mostrar una pregunta. 
  def to_s
    opciones = @distractors + [@right]
    opciones = opciones.shuffle     
    s = "#{@text}\n"
    letras = ('a'..'z').to_a[0..(opciones.size - 1)]
    i = 0
    opciones.each do |o|
     s += "#{letras[i]}) #{o}\n"
     i += 1
    end
    s
  end
  # Sobrecarga el operador <=> para comparar por dificultad.
  def <=>(p)
    @difficulty <=> p.difficulty
  end
  # Sobrecarga el operador == para comparar por el texto.
  def ==(p)
    @text.eql?p.text
  end
end
