require 'examen'


class Examen

  describe Examen do

    before :each do
      @q = Pregunta.new(:text => '2+2=', :right => 4 , :distractors => [9,3,5])
      @n = Nodo.new(@q, nil)
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
    
    context "Nodo" do
      
      it "Debe existir un nodo de la lista con sus datos y su siguiente" do
         
         expect(@n.value)==@p
         expect(@n.next)==nil

      end
    end		
  end			
end
