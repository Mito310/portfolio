class Subject < ApplicationRecord
    has_many :Field

    validates :subject_code, uniqueness: true, presence: {message: '必須項目です'}
    validates :name, presence: {message: '必須項目です'}
end
