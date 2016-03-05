json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :geo, :claim_type, :image, :draft, :hunt_id
  json.url task_url(task, format: :json)
end
