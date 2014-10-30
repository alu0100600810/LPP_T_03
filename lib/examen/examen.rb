require "pregunta"

class Examen
  attr_accessor :cabeza, :cola, :total

  Nodo = Struct.new :value, :next

  def initialize(p)
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
end
