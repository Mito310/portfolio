class Field < ApplicationRecord
    self.primary_keys = :subject_code, :f_code

    belongs_to :subject
    has_many :questions
    
    validates :subject_code, uniqueness: {scope: :f_code, message: 'この分野コードは登録されています'}, presence: {message: '必須項目です'}
    validates :f_code,presence:{message: '必須項目です'}
    validates :f_name, presence:{message: '必須項目です'}

    

   
end
