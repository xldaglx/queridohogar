json.extract! contact, :id, :subject, :body, :email, :phone, :is_read, :property_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)