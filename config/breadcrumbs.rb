crumb :root do
  link "Top page", root_path
end

crumb :item do |item|
  link "商品ページ(#{item.name})", item_path(item)
  parent :root
end

crumb :order do |item|
  link "購入ページ", item_orders_path(item)
  parent :item, item
end
