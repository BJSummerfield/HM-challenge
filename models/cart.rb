require_relative 'pricing_table.rb'

class Cart
  attr_accessor :items

  def initialize(params = {})
    @items = params[:items] || {}
  end

  def add_item(item)
    items[item.to_sym] = {
      quantity: 1
    }
  end

  def increment_item(item)
    items[item][:quantity] += 1
  end

  def increment_or_add(item)
    items[item] ? increment_item(item) : add_item(item)
  end

  def parse(string)
    string.downcase.gsub(" ", "").split(",").each do |item|
      increment_or_add(item.to_sym)
    end
  end

  def get_item_total(item)
    this_item = items[item]
    (PRICING_TABLE[item][:price] * this_item[:quantity]) - get_item_discount(item)
  end

  def get_item_discount(item)
    table_item = PRICING_TABLE[item]
    table_item[:sale_price] > 0 ? table_item[:sale_price] * (items[item][:quantity] / table_item[:sale_quantity]) : 0
  end

  def get_total_cost
    items.keys.each.reduce(0) { |sum, item| sum += get_item_total(item) }
  end

  def get_total_discount
    items.keys.each.reduce(0) {|sum, item| sum += get_item_discount(item) }
  end
end

# cart = Cart.new({:items => {:milk=>{:quantity=>3}, :apple=>{:quantity=>1}, :banana=>{:quantity=>1}, :bread=>{:quantity=>2}}})
# p cart.get_total_discount
