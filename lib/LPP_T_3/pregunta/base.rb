
module LPP_T_3
  class Pregunta
    attr_accessor :text, :right, :distractors
    
    def initialize(args)
      @text = args[:text]
      @right = args[:right]
      @distractors = args[:distractors]
    end
  end
end

