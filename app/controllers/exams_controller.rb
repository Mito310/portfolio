require 'date'
class ExamsController < ApplicationController
  before_action :authenticate_user!
  def create
    s = params[:b_code][0]      #分野選択画面より送信された複合IDを分割しsubject_codeを変数sに代入
    f = params[:b_code][2]      #分野選択画面より送信された複合IDを分割しf_codeを変数fに代入
    exam = Question.where(subject_code: s , f_code: f).sample(10)   #各コードを用いて各分野の問題を１０問取得しランダムに並べ替える
    exam_id = 0
    
    exam.each do |e|
      exam_id += 1              #exam_idを設定（問題番号にも利用)
      Exam.create!(q_code: e.q_code, q_sent: e.q_sent, exam_id: exam_id)    #問題文表示のためexamTBLを作成
    end

    user = current_user.user_id                         #ログイン中のユーザーのユーザーIDを取得
    Record.create( user_id: user, date: Date.today, subject_code: s, f_code: f )       #取得したユーザーID等を成績（Record)TBLに保存、成績IDを作成
    @exam = Exam.find_by(exam_id: 1)      
    redirect_to next_path(@exam.id)     #各問題の表示画面へ遷移

  end

  def show    #問題文表示画面
    @exam = Exam.find(params[:id])      #各問題文のidのレコードを取得
    @choices = Choice.where(q_code: @exam.q_code)   #問題文の選択肢配列を取得
  end


  def answer
    @choice = Choice.find(params[:id])              #問題文の表示画面で選択された選択肢のレコードを取得
    @exam = Exam.find_by( q_code: @choice.q_code)   #問題文のレコードを取得
    right = Choice.find_by(q_code: @choice.q_code, answer: true)    #正解の選択肢のレコードを取得
    @right_ans = right.choice                       #正解の選択肢を代入

    record = Record.where(user_id: current_user.user_id ).last
    record_id = record.id                    #RecordTBLから今回の演習の成績ＩＤを取得
    Result.create(record_id: record_id, q_code: @choice.q_code, user_answer: @choice.answer)    #当該問題の結果をResultTBLに保存

  end

  def delete
    Exam.delete_all         #作成したExamTBLのレコードをすべて削除
    redirect_to '/results/result'   #削除後科目選択画面へ遷移
  end

end
