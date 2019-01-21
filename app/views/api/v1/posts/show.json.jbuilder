json.set! :posts do
  json.extract! @post, :id, :text, :sympathy, :created_at, :updated_at
end
