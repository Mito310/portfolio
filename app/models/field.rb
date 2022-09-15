class Field < ApplicationRecord
    belongs_to :subject_id
    has_many :question
end
