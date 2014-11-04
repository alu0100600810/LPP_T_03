# coding: utf-8
require "pregunta_verdadero_falso"
 
Nodo = Struct.new :value, :next

class Examen
  attr_accessor :cabeza, :cola, :total

  def initialize(p)
    raise TypeError, "Esperada pregunta como parámetro de entrada" unless p.is_a? (Pregunta)
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
     raise TypeError, "Esperada pregunta para inserción" unless p.is_a? (Pregunta) 
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

   def to_s
    aux = @cabeza
    s = ''
    i = 1
    while (aux != nil) do
      s += "#{i}.-) #{aux.value}\n"      
      aux = aux.next
      i += 1
    end
    s
  end

end
