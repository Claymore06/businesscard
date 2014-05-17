json.array!(@name_cards) do |name_card|
  json.extract! name_card, :id, :name, :address, :fax, :tel, :url
  json.url name_card_url(name_card, format: :json)
end
