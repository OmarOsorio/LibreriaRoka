json.array!(@providers) do |provider|
  json.extract! provider, :id, :nombre, :telefono, :email, :direccion, :tipo_libro
  json.url provider_url(provider, format: :json)
end
