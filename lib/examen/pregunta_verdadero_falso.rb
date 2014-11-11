require 'pregunta'

class PreguntaVerdaderoFalso < Pregunta
    
  def initialize(args)
    raise ArgumentError, "Esperada pregunta (:text)" unless args.key?(:text)
    raise ArgumentError, "Esperada respuesta correcta (:right)" unless args.key?(:right)
    args[:right] = ((args[:right])?"Cierto":"Falso")
    args[:distractors] = [((args[:right])?"Falso":"Cierto")]
    super args
  end

end
