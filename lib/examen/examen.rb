# coding: utf-8
require "lista"

class Examen
  attr_accessor :list
   
  def initialize(p)
    @list = Lista.new(p)
  end

  def to_s
    "#{@list}"
  end

end
