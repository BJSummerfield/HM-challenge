require "bigdecimal"

# Assuming there is logic to take the given table and turn it into the following data structure

# Item     Unit price        Sale price
# --------------------------------------
# Milk      $3.97            2 for $5.00
# Bread     $2.17            3 for $6.00
# Banana    $0.99
# Apple     $0.89


PRICING_TABLE = {
  milk: {
    price: BigDecimal("3.97"),
    sale_quantity: 2,
    sale_price: BigDecimal("2.94")
  },
  bread: {
    price: BigDecimal("2.17"),
    sale_quantity: 3,
    sale_price: BigDecimal("0.51")
  },
  banana: {
    price: BigDecimal("0.99"),
    sale_quantity: 0,
    sale_price: 0
  },
  apple: {
    price: BigDecimal(".89"),
    sale_quantity: 0,
    sale_price: 0
  }
}
