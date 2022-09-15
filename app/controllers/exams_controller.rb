require 'date'
class ExamsController < ApplicationController
  before_action :authenticate_user!

  # GET /exams/1 or /exams/1.json
  def show
    @exam = Exam.find(params[:id])      #各問題文のidのレコードを取得
    @choices = Choice.where(question_id: @exam.question_id)   #問題文の選択肢配列を取得
  end



  # POST /exams or /exams.json
  def create
    f = params[:b_code]     #分野選択画面より送信された複合IDを分割しsubject_codeを変数fに代入
    s = $k_code      #分野選択画面より送信された複合IDを分割しf_codeを変数sに代入
    exam = Question.where(subject_id: s , field_id: f).sample(10)   #各コードを用いて各分野の問題を１０問取得しランダムに並べ替える
    exam_no = 0
    
    exam.each do |e|
      exam_no += 1              #exam_idを設定（問題番号にも利用)
      Exam.create!(question_id: e.id, sentence: e.sentence, exam_no: exam_no)    #問題文表示のためexamTBLを作成
    end

    user = current_user.user_id                         #ログイン中のユーザーのユーザーIDを取得
    Record.create( user_id: user, date: Date.today, subject_id: s, field_id: f )       #取得したユーザーID等を成績（Record)TBLに保存、成績IDを作成
    @exam = Exam.find_by(exam_no: 1)      
    redirect_to next_path(@exam.id)     #各問題の表示画面へ遷移
  end



  def answer
    @choice = Choice.find(params[:id])              #問題文の表示画面で選択された選択肢のレコードを取得
    p "1-----------------------------------"
    p @choice
    p "2-----------------------------------"

    @exam = Exam.find_by(question_id: @choice.question_id)
    p "3-----------------------------------"
    p @exam   #問題文のレコードを取得
    p "4-----------------------------------"

    right = Choice.find_by(question_id: @choice.question_id, answer: true)    #正解の選択肢のレコードを取得
    @right_ans = right.choice                       #正解の選択肢を代入

    record = Record.where(user_id: current_user.user_id ).last
    record_id = record.id                    #RecordTBLから今回の演習の成績ＩＤを取得
    Result.create(record_id: record_id, question_id: @choice.question_id, user_answer: @choice.answer)    #当該問題の結果をResultTBLに保存

  end

  def delete
    Exam.delete_all         #作成したExamTBLのレコードをすべて削除
    redirect_to '/results/result'   #削除後科目選択画面へ遷移
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:question_id, :sentence)
    end
end
