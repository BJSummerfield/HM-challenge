require_relative '../models/cart.rb'
require_relative '../views/view_cart.rb'

items = ViewCart.get_items
cart = Cart.new
cart.parse(items)
p cart
cart.total
ViewCart.render(cart)
