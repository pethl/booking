json.extract! restaurant, :id, :account_id, :name, :location, :website, :primary_contact, :email, :phone, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
