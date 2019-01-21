json.set! :posts do
  json.array! @post do |post|
    json.extract! post, :id, :text, :sympathy, :created_at, :updated_at
  end
end
