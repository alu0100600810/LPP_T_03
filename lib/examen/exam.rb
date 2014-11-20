# coding: utf-8
require "lista"

class Exam
  attr_accessor :list
   
  def initialize(p)
    @list = Lista.new(p)
  end

  def to_s
    "#{@list}"
  end

  def <<(p)    
     @list << p
  end 

  def push_back(*preguntas)
    preguntas.each { |p| @list << p}
    preguntas
  end 

end
