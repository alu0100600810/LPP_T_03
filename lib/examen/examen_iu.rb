# encoding: utf-8
require 'exam'

class ExamenIu
  attr_accessor :exam
  def initialize(pregunta)
    @exam = Exam.new(pregunta)
  end

end
