json.extract! todo, :id, :date, :title, :content, :user_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
