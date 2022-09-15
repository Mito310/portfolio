class Field < ApplicationRecord
    belongs_to :subject
    has_many :question
end
