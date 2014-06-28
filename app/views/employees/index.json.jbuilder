json.array!(@employees) do |employee|
  json.extract! employee, :id, :nombre, :usuario, :password, :email, :direccion, :telefono, :meta, :gerente, :vendedor
  json.url employee_url(employee, format: :json)
end
