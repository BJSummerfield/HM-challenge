class ViewCart
  def render_cart(cart)
    render(header)
    render(item_list(cart))
    render(footer(cart.get_total_cost, cart.get_total_discount))
  end

  def item_list(cart, table = [])
    cart.items.each do |key, value|
      table << key.to_s.capitalize() + " " * (12 - (key.to_s).length) + value[:quantity].to_s + " " * (12 - (value[:quantity].to_s).length) + "$#{cart.get_item_total(key).to_s("F")}"
    end
    table.join("\n")
  end

  def render(template)
    puts template
  end

  def prompt_items
    render("Please enter all the items purchased separated by a comma")
  end

  def header
    [
      nil,
      "Item      Quantity      Price",
      "------------------------------------"
    ].join("\n")
  end

  def footer(total, discount)
    [
      nil,
      "Total price : $#{total.to_s("F")}",
      "You saved $#{discount.to_s("F")}"
    ].join("\n")
  end
end
