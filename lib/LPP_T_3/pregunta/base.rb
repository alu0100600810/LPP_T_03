
module LPP_T_3
  class Pregunta
    attr_accessor :text, :right, :distractors
    
    def initialize(args)
      raise ArgumentError, "Esperada pregunta (:text)" unless args[:text]
      raise ArgumentError, "Esperada respuesta correcta (:right)" unless args[:right]
      raise ArgumentError, "Esperadas respuestas incorrectas (:distractors)" unless args[:distractors]
      @text = args[:text]
      @right = args[:right]
      @distractors = args[:distractors]
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
  end
end
