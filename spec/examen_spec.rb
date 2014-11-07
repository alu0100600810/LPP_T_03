require 'spec_helper'
require 'examen'

class Pregunta
  describe Examen do

    before :each do
      @q = Pregunta.new(:text => '2+2=', :right => 4 , :distractors => [9,3,5])      
    end

    context "Pregunta" do
      it "Debe tener texto y alguna pregunta" do
        expect(@q.text)=='2+2='
	expect(@q.right)==4
      end
      it "debe tener 3 componentes" do
        expect {Pregunta.new(:text => '5*8=?')}.to raise_error(ArgumentError)	
      end
      it "mostrar pregunta" do
        expect(@q).to respond_to :text
      end
      it "mostrar respuesta correcta" do
        expect(@q).to respond_to :right
      end
      it "mostrar opciones incorrectas" do
        expect(@q).to respond_to :distractors
      end
      it "mostrar por pantalla" do
        expect(@q).to respond_to :to_s
      end
      it "mostrarse correctamente" do
        expect(@q.to_s).to match(/(\d|\w)+\n(\d\)\s+(\w|\d)+\n)+/)
      end
	
    end    	
  end	
end


class Examen

  describe Examen do
    before :each do
      @q = Pregunta.new(:text => '2+2=', :right => 4 , :distractors => [9,3,5])
      @n = Nodo.new(@q, nil, nil)
      @e = Examen.new(@q)
    end

    context "Nodo" do     
      it "Debe existir un nodo de la lista con sus datos con su siguiente y su anterior" do         
         expect(@n.value)==@q
         expect(@n.next)==nil
         expect(@n.prev)==nil
      end
    end
    context "List" do
      it "Se puede extraer el primer elemento de la lista" do
         expect(@e).to respond_to :pop
	 expect(@e.pop)== @q

      end
      it "Se puede insertar un elemento" do 
         expect(@e).to respond_to :<<
         expect {@e << @n}.to raise_error(TypeError)
         expect {@e << @e}.to raise_error(TypeError)
         expect {@e << @q}==@q

      end
      it "Se puede insertar varios elementos" do
         expect(@e).to respond_to :push_back
         expect(@e.push_back(@q, @q)).to be_instance_of(Array)
      end

      it "Debe existir una lista con su cabeza" do
	 expect(@e).to respond_to :cabeza
      end

      it "Debe inicializarse con una pregunta" do
        expect {Examen.new()}.to raise_error(ArgumentError)
        expect {Examen.new(Nodo.new(@q, nil, nil))}.to raise_error(TypeError)
      end

      it "Debe mostrarse correctamente" do
        text = "¿Cuál es la salida del siguiente código Ruby?\nclass Xyz\n\sdef pots\n\s\s@nice\n\send\nend\n\nxyz = Xyz.new\np xyz.pots"
        examen = Examen.new(Pregunta.new(:text => text, :right =>"nil", :distractors => ["#<Xyz:0xa000208>","0","Ninguna de las anteriores"]))

        text = "La siguiente definición de un hash en Ruby es válida:\nhash_raro = {\n\s[1, 2, 3] => Object.new(),\nHash.new => :toto\n}"
        examen << PreguntaVerdaderoFalso.new(:text => text, :right => false)

        text = %Q{¿Cuál es la salida del siguiente código Ruby?\nclass Array\n\sdef say_hi\n\s\s"HEY!"\n\send\nend\n p [1, "bob"].say_hi}
        examen << Pregunta.new(:text => text, :right =>"HEY!", :distractors => ["1","bob","Ninguna de las anteriores"])
   
        text = "¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend"
        examen << Pregunta.new(:text => text, :right =>"Una instancia de la clase Class", :distractors => ["Una Constante", "Un Objeto", "Ninguna de las anteriores"])
   
        text = "Es apropiado que una clase Tablero herede de una clase Juego"
        examen << PreguntaVerdaderoFalso.new(:text => text, :right => false)
	        
        expect(examen.to_s).to match(/(\d+\.-\)(.|\s|\n)+)+/)
      end

    end 	
  end  		
end


class PreguntaVerdaderoFalso

  describe Examen do
	before :each do
      @q = PreguntaVerdaderoFalso.new(:text => '¿2+2=4?', :right => true)
    end

   context "Pregunta Verdadero y Falso" do
      it "Debe tener texto y alguna pregunta" do
        expect(@q.text)=='¿2+2=4?'
        expect(@q.right)=='Cierto'
      end

      it "Debe heredar de Pregunta" do
        expect(@q).to be_a Pregunta
      end

      it "Debe no ser instancia de Pregunta" do
        expect(@q.instance_of?Pregunta).to eq(false)
      end
      
      it "debe tener 2 componentes" do
        expect {PreguntaVerdaderoFalso.new(:text => '5*8=?')}.to raise_error(ArgumentError)
      end
      it "mostrar pregunta" do
        expect(@q).to respond_to :text
      end
      it "mostrar respuesta correcta" do
        expect(@q).to respond_to :right
      end
      it "mostrar opciones incorrectas" do
        expect(@q).to respond_to :distractors
      end
      it "mostrar por pantalla" do
        expect(@q).to respond_to :to_s
      end
      it "mostrarse correctamente" do
        expect(@q.to_s).to match(/(\d|\w)+\n(\d\)\s+(\w|\d)+\n)+/)
      end

    end


  end
end
