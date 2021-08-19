require_relative 'pricing_table.rb'

class Cart
  attr_accessor :items

  def initialize(params = {})
    @items = params[:items] || {}
  end

  def add_item(item)
    items[item.to_sym] = {
      quantity: 1,
      total: 0,
      discount: 0
    }
  end

  def increment_item(item)
    items[item][:quantity] += 1
  end

  def increment_or_create(item)
    items[item] ? increment_item(item) : add_item(item)
  end

  def parse(string)
    string.downcase.gsub(" ", "").split(",").each do |item|
      increment_or_create(item.to_sym)
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
