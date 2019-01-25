json.set! :posts do
  json.array! @posts do |post|
    json.extract! post, :id, :text, :sympathy, :created_at, :updated_at
  end
end
