class SeisekiController < ApplicationController
    def index
        @record = Record.where(user_id: current_user.user_id)   #ログイン中のユーザーの過去の成績を取得
        record = Record.where(user_id: current_user.user_id)
        record_id = record.ids
    
        @result = Result.where(record_id: record_id)            
        @right = Result.where(record_id: record_id, user_answer: true)
    end

    def detail
      @data = Result.where(record_id: params[:id])           
      @right = Result.where(record_id: params[:id], user_answer: true)

    end
    
end
