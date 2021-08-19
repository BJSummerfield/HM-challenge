# class ViewCart
#   def self.render(cart)
#     print_headers
#     total = 0
#     savings = 0
#     cart.items.each do |key,value|
#       key_length = key.length
#       quantity_length = value[:quantity].to_s.length
#       puts key.capitalize() + " " * (12 - key_length) + value[:quantity].to_s + " " * (12 - quantity_length) + "$" + value[:total].to_s("F")
#       total += value[:total]
#       savings += value[:discount]
#     end
#     print_footer(total, savings)
#   end

#   def self.print_headers
#     puts "\n"
#     puts "Item      Quantity      Price"
#     puts "------------------------------------"
#   end

#   def self.print_footer(total,savings)
#     puts "\n"
#     puts "Total price : $#{total.to_s("F")}"
#     puts "You saved $#{savings.to_s("F")} today."
#   end

#   def self.get_items
#     puts "Please enter all the items purchased separated by a comma"
#     return gets.chomp
#   end
# end

class ViewCart
  def render_cart(cart)
    render(header)
    render(footer(cart.get_total_cost, cart.get_total_discount))
  end

  def render(template)
    puts template
  end

  def prompt_items
    render("Please enter all the items purchased separated by a comma")
  end

  def header
    [
      "Item      Quantity      Price",
      "------------------------------------"
    ].join("\n")
  end

  def footer(total, discount)
    [
      "Total price : $#{total.to_s("F")}",
      "You saved $#{discount.to_s("F")}"
    ].join("\n")
  end
end
