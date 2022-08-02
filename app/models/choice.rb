class Choice < ApplicationRecord
    belongs_to :question

    def next(exam)
        exam.choices.where("id > ?", self.id).order("id ASC").first
    end

end
