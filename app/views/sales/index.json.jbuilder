json.array!(@sales) do |sale|
  json.extract! sale, :id, :client_id, :fecha_venta :importe
  json.url sale_url(sale, format: :json)
end
