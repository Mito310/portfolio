class SelectController < ApplicationController
    $k_code = 2

    def select
        @kamoku = Subject.find_by(subject_code: $k_code)

        @bunya = Field.where(subject_code: $k_code)
    end

    def test
        @bunya = Field.where(subject_code: $k_code)
        @b_para = params[:b_code]
    end
    
end
