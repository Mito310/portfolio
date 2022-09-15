json.extract! result, :id, :record_id, :question_id, :user_answer, :created_at, :updated_at
json.url result_url(result, format: :json)
