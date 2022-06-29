class SelectController < ApplicationController
    before_action :authenticate_user!, only: :menu
    def menu
    end

    def science
        $k_code = 1
        redirect_to '/select/select'
    end

    def social_study
        $k_code = 2
        redirect_to '/select/select'
    end
    def select
        @kamoku = Subject.find_by(subject_code: $k_code)

        @bunya = Field.where(subject_code: $k_code)
    end

    
end
