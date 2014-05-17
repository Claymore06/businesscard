json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address, :fax, :tel, :url
  json.url company_url(company, format: :json)
end
