json.extract! question, :id, :q_code, :q_sent, :subjet_code, :f_code, :created_at, :updated_at
json.url question_url(question, format: :json)
