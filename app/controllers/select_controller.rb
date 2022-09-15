class SelectController < ApplicationController
    before_action :authenticate_user!, only: :menu
    def menu
    end

    def science
        $k_code = 1                     #グローバル変数に理科のsubject_codeを代入
        redirect_to '/select/select'    #分野選択画面へ移動
    end

    def social_study
        $k_code = 2                     #グローバル変数に社会のsubject_codeを代入
        redirect_to '/select/select'    
    end
    def select
        @kamoku = Subject.find($k_code)    #理科ないし社会のレコードを取得（科目名取得のため）

        @bunya = Field.where(subject_id: $k_code)         #各科目の分野配列を取得

    end

    
end
