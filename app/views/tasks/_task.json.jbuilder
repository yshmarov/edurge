json.extract! task, :id, :name, :descroption, :video_url, :chapter_id, :created_at, :updated_at
json.url task_url(task, format: :json)
