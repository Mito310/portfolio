class FieldsController < ApplicationController
    def index
        @msg = 'データ'
        @data = Field.all
    end

    def show
        @msg = "分野"
        @data = Field.find(params[:id])
    end
    
     def add
        @msg = "追加"

     end

    def create
        @field = Field.new field_params
        if @field.save then
            redirect_to '/fields/add'
        else
            re = ''
            @field.errors.messages.each do |key, vals|
                vals.each do |val|
                    re += '<span style="color:red">' + key.to_s +
                            '</span>' + val + '<br>'
                end
            end
            @msg = re.html_safe
            render 'add'
        end

=begin
        if request.post? then
                Field.create(field_params)
        end
        redirect_to '/fields/add'
=end
    end

    def edit
        @msg = "edit data.[id = " + params[:id] + "]"
        @field = Field.find(params[:id])
    end

    def update
         @field = Field.find(params[:id])
        @field.update(field_params)
        redirect_to '/fields/index'
    end

    def delete
        obj = Field.find(params[:id])
        obj.destroy
        redirect_to '/fields/index'
    end
    
    private
    def field_params
        params.permit(:subject_code, :f_code, :f_name)
    end
end
