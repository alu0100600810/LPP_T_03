# coding: utf-8
require "pregunta"

class Examen
  attr_accessor :cabeza, :cola, :total

  Nodo = Struct.new :value, :next

  def initialize(p)
    raise TypeError, "Esperada pregunta como parámetro de entrada" unless p.instance_of? (Pregunta)
    @cabeza = Nodo.new(p, nil)
    @cola = @cabeza
    @total = 1
  end

  def pop
    head = @cabeza
    @cabeza = @cabeza.next
    head.next = nil
    @total -= 1
    head.value
  end

  def <<(p)
     @cola.next = Nodo.new(p, nil)
     @cola = @cola.next    
     @total += 1
     @cola.value
  end

  def push_back(*preguntas)
    preguntas.each do |p|
      @cola.next = Nodo.new(p, nil)
      @cola = @cola.next
      @total += 1
    end
    preguntas
  end

end
