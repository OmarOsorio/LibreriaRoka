json.array!(@clients) do |client|
  json.extract! client, :id, :nombre, :telefono, :email, :direccion, :rfc, :facebook, :linkedln
  json.url client_url(client, format: :json)
end
