json.array!(@books) do |book|
  json.extract! book, :id, :isbn, :titulo, :autor, :editorial, :precio, :existencias
  json.url book_url(book, format: :json)
end
