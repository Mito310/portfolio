json.extract! record, :id, :user_id, :date, :subject_id, :field_id, :created_at, :updated_at
json.url record_url(record, format: :json)
