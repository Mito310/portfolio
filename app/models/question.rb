class Question < ApplicationRecord
    belongs_to :subject
    belongs_to :field
    has_many :choice

end
