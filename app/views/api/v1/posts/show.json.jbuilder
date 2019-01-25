json.set! :post do
  json.extract! @post, :id, :text, :sympathy, :created_at, :updated_at
end
