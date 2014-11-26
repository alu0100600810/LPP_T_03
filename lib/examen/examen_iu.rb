# encoding: utf-8
require 'exam'
# Clase gestora de la Interfaz de usuario de la gema.
class ExamenIu
  attr_accessor :exam
  # Crea una nueva instancia a partir de una pregunta.
  def initialize(pregunta)
    @exam = Exam.new(pregunta)
  end
  # Dado un conjunto de respuestas las evalua e indica cuales son correctas y cuales no. 
  def test(resp)
    result = Array.new(@exam.list.count, 0)
    i = 0
    @exam.list.each do |p|
      result[i] = (p.right.to_s.eql?resp[i].to_s)?1:0
      i += 1
    end
    result
  end
  # Muestra la Interfaz de Usuario solicitando por pantalla las respuestas e indicando si son correctas o no.
  def testinteractivo
    result = Array.new(@exam.list.count, 0)
    i = 0
    acertadas = 0
    @exam.list.each do |p|
      pActual = p.to_s
      puts (i + 1).to_s + ") " + pActual
      STDOUT.flush
      opc = pActual.match(%r{#{gets.chomp}\)\s+(.*)})[1]      
      result[i] = (p.right.to_s.eql?opc)?1:0
      acertadas += 1 if (result[i] == 1)
      puts "> Respuesta #{((result[i] == 1)?"correcta":"incorrecta") + " (" + acertadas.to_s + "/" + result.size.to_s + ")"}\n\n"
      i += 1
    end
    result
  end

end
