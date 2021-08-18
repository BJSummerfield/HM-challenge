require "./pricing_table"

class Cart
  attr_accessor :items

  def initialize(params = {})
    @items = params.fetch(:items, Hash.new)
  end

  def create(item)
    items[item] = {
      :quantity => 1,
      :total => nil,
      :discount => 0
    }
  end

  def increment(item)
    items[item][:quantity] += 1
  end

  def increment_or_create(item)
    return increment(item) if items.key?(item)
    create(item)
  end

  def parse(string)
    string.downcase.gsub(" ", "").split(",").each do |item|
      increment_or_create(item)
    end
  end

  def set_item_total(item)
    this_item = items[item]
    this_item[:total] = (PRICING_TABLE[item][:price] * this_item[:quantity]) - this_item[:discount]
  end

  def set_item_discount(item)
    this_item = items[item]
    table_item = PRICING_TABLE[item]
    this_item[:discount] = table_item[:sale_price] * (this_item[:quantity] / table_item[:sale_quantity])
  end

  def total
    items.each do |item, qty|
      set_item_discount(item) if PRICING_TABLE[item][:sale] == true
      set_item_total(item)
    end
  end

end

# cart = Cart.new
# cart.parse("milk,milk, bread,banana,bread,bread,bread,milk,apple")
# cart.total
# cart.items.each do |k,v|
#   p k
#   p cart.items[k][:total].to_s("F")
#   p "**"
# end


