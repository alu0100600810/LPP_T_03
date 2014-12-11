# coding: utf-8
require "pregunta_verdadero_falso"
 
Nodo = Struct.new :value, :next, :prev

# Clase gestora de Lista doblemente enlazada.
class Lista
  attr_accessor :cabeza, :cola, :total
  
  include Enumerable

  # Instancia de la clase Lista a partir de una Pregunta.
  def initialize(p)
    raise TypeError, "Esperada pregunta como parámetro de entrada" unless p.is_a? (Pregunta)
    @cabeza = Nodo.new(p, nil, nil)
    @cola = @cabeza
    @total = 1
  end

   # Extrae la cabeza de la lista actualmente. Si la lista está vacía genera una excepción (IndexError).
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

  # Sobrecarga del operador << para insertar una pregunta al final de la lista.
  def <<(p)
     raise TypeError, "Esperada pregunta para inserción" unless p.is_a? (Pregunta)
     if (@total == 0)
       @cabeza = Nodo.new(p, nil, nil)
       @cola = @cabeza
     else
       @cola.next = Nodo.new(p, nil, @cola)
       @cola = @cola.next
       @cola.value
     end
     @total += 1
  end

  # Inserta una o varias preguntas sucesivamente. 
  def push_back(*preguntas)
    preguntas.each do |p|
      if (@total == 0)
        @cabeza = Nodo.new(p, nil, nil)
        @cola = @cabeza
      else
        @cola.next = Nodo.new(p, nil, @cola)
        @cola = @cola.next
      end
      @total += 1
    end
    preguntas
  end

  # Definición del Metotodo to_s, para la clase Lista. 
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
  
  # Definición del método :each para el manejo de métodos del módulo Enumerable.
  def each
    aux = @cabeza
    while (aux != nil) do
      yield aux.value
      aux = aux.next
    end
  end

  # Devuelve la lista actual invertida.
  def inv(&block)
    block = ->(x) {true} if !block_given?
    list = invertir(@cabeza, &block)
    list.pop
    return nil if list.total == 0
    list
  end 

  # Método auxiliar utilizado para invertir la lista mediante recursividad.
  def invertir(actual, &block)
    return Lista.new(Pregunta.new(:text => "dummy", :right => "dummy", :distractors => ["dummy"])) if (actual == nil)
    list = invertir(actual.next, &block)
    list << actual.value if block[actual.value]
    list    
  end 

  private :invertir

end
