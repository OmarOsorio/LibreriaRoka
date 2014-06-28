json.array!(@detail_orders) do |detail_order|
  json.extract! detail_order, :id, :order_id, :book_id, :cantidad
  json.url detail_order_url(detail_order, format: :json)
end
