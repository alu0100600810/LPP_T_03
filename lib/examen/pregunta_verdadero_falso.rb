# encoding: utf-8
require 'pregunta'

# Clase gestora de preguntas de verdadero y falso.
class PreguntaVerdaderoFalso < Pregunta
    
  # Instancia de la clase PreguntaVerdaderoFalso donde le pasas un texto y un booleano asociado a la respuesta correcta.
  def initialize(args)
    raise ArgumentError, "Esperada pregunta (:text)" unless args.key?(:text)
    raise ArgumentError, "Esperada respuesta correcta (:right)" unless args.key?(:right)
    args[:right] = ((args[:right])?"Cierto":"Falso")
    args[:distractors] = [((args[:right])?"Falso":"Cierto")]
    super args
  end

end
