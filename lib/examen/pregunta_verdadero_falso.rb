require 'pregunta'

class PreguntaVerdaderoFalso < Pregunta
    
  def initialize(args)
    raise ArgumentError, "Esperada pregunta (:text)" unless args.key?(:text)
    raise ArgumentError, "Esperada respuesta correcta (:right)" unless args.key?(:right)
    super(:text => args[:text], :right => ((args[:right])?"Cierto":"Falso"), :distractors => [((args[:right])?"Falso":"Cierto")])
  end

end
