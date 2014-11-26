# coding: utf-8
require "pregunta_verdadero_falso"
 
Nodo = Struct.new :value, :next, :prev

class Lista
  attr_accessor :cabeza, :cola, :total
  
  include Enumerable

  def initialize(p)
    raise TypeError, "Esperada pregunta como parámetro de entrada" unless p.is_a? (Pregunta)
    @cabeza = Nodo.new(p, nil, nil)
    @cola = @cabeza
    @total = 1
  end

   def pop
    raise IndexError, "Lista vacía, imposible hacer pop" unless @total > 0
    head = nil
    if @cola == @cabeza
      head = @cabeza
      @cola = @cabeza = nil
      head.next = head.prev = nil
    else
    head = @cabeza
    @cabeza = @cabeza.next
    @cabeza.prev = nil
    head.next = nil
    end
    @total -= 1
    head.value
  end

  def <<(p)    
     raise TypeError, "Esperada pregunta para inserción" unless p.is_a? (Pregunta) 
     @cola.next = Nodo.new(p, nil, @cola)
     @cola = @cola.next    
     @total += 1
     @cola.value
  end

  def push_back(*preguntas)
    preguntas.each do |p|
      @cola.next = Nodo.new(p, nil, @cola)
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
  
  def each
    aux = @cabeza
    while (aux != nil) do
      yield aux.value
      aux = aux.next
    end
  end

  def inv(&block)
    block = ->(x) {true} if !block_given?
    list = invertir(@cabeza, &block)
    list.pop
    return nil if list.total == 0
    list
  end 

  def invertir(actual, &block)
    return Lista.new(Pregunta.new(:text => "dummy", :right => "dummy", :distractors => ["dummy"])) if (actual == nil)
    list = invertir(actual.next, &block)
    list << actual.value if block[actual.value]
    list    
  end 

  private :invertir

end
