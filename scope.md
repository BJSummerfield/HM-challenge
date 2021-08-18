*Need to handle Floats / Money*

Input string - (will need to get mutated and parsed by the cart)

##Cart
Hash that contains
{items: [{item_name: [int of qty]}], total: nil, savings: nil}

#Logic in cart
increment || create

#Parse input string and quantify inputs

#Total
Will set total / savings to zero and loop through items setting total and savings


##Pricing Table
Hash that contains current items / pricing / discounts / discount value

{ item_name: {
              price_per_unit: [price],
              discount_qty: [int],
              discount_value: [((price_per_unit*discount_qty) - sale price]
              }
            }





