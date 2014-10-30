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
      @n = Examen::Nodo.new(@q, nil)
      @e = Examen.new(@q)
    end

    context "Nodo" do     
      it "Debe existir un nodo de la lista con sus datos y su siguiente" do         
         expect(@n.value)==@q
         expect(@n.next)==nil
      end
    end
    context "List" do
      it "Se puede extraer el primer elemento de la lista" do

         expect(@e).to respond_to :pop
	 expect(@e.pop)== @q

      end
      it "Se puede insertar un elemento" do 

         expect(@e).to respond_to :<<
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
        expect {Examen.new(Examen::Nodo.new(@q, nil))}.to raise_error(TypeError)
      end
    end 	
  end  		
end
