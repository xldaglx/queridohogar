json.extract! image, :id, :url_path, :order, :created_at, :updated_at
json.url image_url(image, format: :json)