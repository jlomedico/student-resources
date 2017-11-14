json.array!(@messages) do |message|
  json.extract! message, :id, :topic, :body
  json.url message_url(message, format: :json)
end
