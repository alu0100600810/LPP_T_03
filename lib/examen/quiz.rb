# encoding: utf-8
require "exam"

class Quiz
  attr_accessor :exam, :count, :title

  def initialize(title, &block)
    @title = title
    @exam = Exam.new(Pregunta.new(:text => "dummy", :right => "dummy", :distractors => ["dummy"]))
    @exam.list.pop
    @count = 0 
    instance_eval &block
  end 

  def right
    :right
  end 
  
  def wrong
    @count += 1
    [:wrong, @count]
  end 

  def question(*args)
    distract = Array.new
    args[1].keys.each { |x| distract << args[1][x] if x.class.equal? Array }
    exam << Pregunta.new(:text => args[0], :right => args[1][:right], :distractors => distract)
    exam
  end 
end
