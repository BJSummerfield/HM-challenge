class ViewCart
  def self.render(cart)
    print_headers
    total = 0
    savings = 0
    cart.each do |key,value|
      key_length = key.length
      quantity_length = value[:quantity].to_s.length
      puts key.capitalize() + " " * (12 - key_length) + value[:quantity].to_s + " " * (12 - quantity_length) + "$" + value[:total].to_s
      total += value[:total]
      savings += value[:discount]
    end
    print_footer(total, savings)
  end

  def self.print_headers
    puts "\n"
    puts "Item      Quantity      Price"
    puts "------------------------------------"
  end

  def self.print_footer(total,savings)
    puts "\n"
    puts "Total price : $#{total.to_s}"
    puts "You saved $#{savings.to_s} today."
  end
end


# cart = {
#   "milk"=>{
#     :quantity=>3,
#     :total=>0.897e1,
#     :discount=>0.294e1
#   },
#   "bread"=>{
#     :quantity=>4,
#     :total=>0.817e1,
#     :discount=>0.51e0
#   },
#   "banana"=>{
#     :quantity=>1,
#     :total=>0.99e0,
#     :discount=>0
#   },
#   "apple"=>{
#     :quantity=>1,
#     :total=>0.89e0,
#     :discount=>0
#   }
# }
# # p cart
# ViewCart.render(cart)
