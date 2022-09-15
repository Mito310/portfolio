class Exam < ApplicationRecord
    def next
        Exam.where("id > ?", self.id).order("id ASC").first
     end
end
