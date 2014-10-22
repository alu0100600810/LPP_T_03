require 'LPP_T_3/pregunta.rb'

module LPP_T_3
	class Pregunta

	    describe LPP_T_3::Pregunta do
	        before :each do
		       @q = LPP_T_3::Pregunta.new(:text => '2+2=', :right => 4 , :distractors => [9,3,5])

	        end

	        context "Cuando se construye una pregunta" do
	             it"Debe tener texto y alguna pregunta" do
		         expect(@q.text)=='2+2='
		         expect(@q.right)==4
	             end
	
	        end
	    end

	end
end
