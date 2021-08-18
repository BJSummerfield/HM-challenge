require "./pricing_table"

class Cart
  attr_accessor :items, :total, :savings

  def initialize(params = {})
    @items = params.fetch(:items, Hash.new)
    @total = params.fetch(:total, nil)
    @savings = params.fetch(:savings, nil)
  end

  def create(item)
    items[item] = {
      :quantity => 1
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
    string.downcase.gsub(' ', '').split(',').each do |item|
      increment_or_create(item)
    end
  end

end

c = Cart.new(:items => {'milk' => {:quantity => 3}})
c.parse('mIlk , apple')
c.parse('apple')

# TODO add logic to total using pricing table

