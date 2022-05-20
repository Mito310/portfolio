class Field < ApplicationRecord
    self.primary_keys = :subject_code, :f_code

    def to_param
        persisted? ? to_key.join(',') : nil
    end
    
end
