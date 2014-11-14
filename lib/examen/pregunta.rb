# encoding: utf-8
class Pregunta
  attr_accessor :text, :right, :distractors, :difficulty

  include Comparable  
  
  def initialize(args)
    raise ArgumentError, "Esperada pregunta (:text)" unless args[:text]
    raise ArgumentError, "Esperada respuesta correcta (:right)" unless args[:right]
    raise ArgumentError, "Esperadas respuestas incorrectas (:distractors)" unless args[:distractors]
    @text = args[:text]
    @right = args[:right]
    @distractors = args[:distractors]
    @difficulty = (args.key?:difficulty)?args[:difficulty]:1
  end
   
  def to_s
    "#{@text}"
    opciones = @distractors + [@right]
    opciones = opciones.shuffle     
    s = "#{@text}\n"
    i = 0
    opciones.each do |o|
     s += "#{i}) #{o}\n"
     i += 1
    end
    s
  end

  def <=>(p)
    @difficulty <=> p.difficulty
  end

  def ==(p)
    @text.eql?p.text
  end
end
