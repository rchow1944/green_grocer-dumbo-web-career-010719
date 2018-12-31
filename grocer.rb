require 'pry'

def consolidate_cart(cart)
  # code here
  cart_hash = {}
  cart.each do |item|
    item.each do |item_name, value|
      if cart_hash[item_name] == nil
        cart_hash[item_name] = value
        cart_hash[item_name][:count] = 1 
      elsif cart_hash[item_name] != nil
        cart_hash[item_name]
      end
    end
    binding.pry
  end
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
