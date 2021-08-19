require_relative '../models/cart.rb'
require_relative '../views/view_cart.rb'

terminal_view = ViewCart.new
terminal_view.prompt_items
items = gets.chomp
cart = Cart.new
cart.parse(items)
terminal_view.render_cart(cart)
