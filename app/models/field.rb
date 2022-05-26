class Field < ApplicationRecord
    self.primary_keys = :subject_code, :f_code

    validates :subject_code, uniqueness: {scope: :f_code, message: 'この分野コードは登録されています'}, presence: {message: '必須項目です'}
    

    def to_param
        persisted? ? to_key.join(',') :nil
    end
   
end
