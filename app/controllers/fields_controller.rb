class FieldsController < ApplicationController
    def index
        @msg = 'データ'
        @data = Field.all
    end

    def show
        @msg = "分野"
        @data = Field.find_by(subject_code: params[:subject_code], f_code: params[:f_code])
     end
    
     def add
        @msg = "追加"

     end

     def create
        if request.post? then
            obj = Field.create(
                subject_code:params['subject_code'],
                f_code:params['f_code'],
                f_name:params['f_name']
            )
        end
        redirect_to '/fields/add'
    end
    
end
