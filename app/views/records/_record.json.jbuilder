json.extract! record, :id, :user_id, :date, :subject_code, :f_code, :created_at, :updated_at
json.url record_url(record, format: :json)
