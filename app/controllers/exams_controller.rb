class ExamsController < ApplicationController
  def create
    s = params[:b_code][0]
    f = params[:b_code][2]
    exam = Question.where(subject_code: s , f_code: f).sample(10)
    exam_id = 0
    
    exam.each do |e|
      exam_id += 1
      Exam.create!(q_code: e.q_code, q_sent: e.q_sent, exam_id: exam_id)
    end
    @exam = Exam.find_by(exam_id: 1)
    redirect_to next_path(@exam.id)

  end

  def show
    @exam = Exam.find(params[:id])
    @choices = Choice.where(q_code: @exam.q_code)
  end


  def answer
    @choice = Choice.find(params[:id])
    @exam = Exam.find_by( q_code: @choice.q_code)
    right = Choice.find_by(q_code: @choice.q_code, answer: true)
    @right_ans = right.choice
  end


  def delete
    Exam.delete_all
    redirect_to '/select'
  end

end
