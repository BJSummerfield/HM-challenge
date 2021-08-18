require '../models/pricing_table'
require '../models/cart'
require '../views/view_cart'

items = ViewCart.get_items
cart = Cart.new
cart.parse(items)
cart.total
ViewCart.render(cart)
