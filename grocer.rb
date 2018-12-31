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
        cart_hash[item_name][:count] += 1
      end
    end
    #binding.pry
  end
  cart_hash
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
    if cart[coupon[:item]] != nil
      #binding.pry
      if cart[coupon[:item]][:count] >= coupon[:num]
        cart[coupon[:item]][:count] -= coupon[:num]
      
        item_with_coupon = coupon[:item] + " W/COUPON"
        if cart[item_with_coupon] == nil
          cart[item_with_coupon] = {
            :price => coupon[:cost],
            :clearance => cart[coupon[:item]][:clearance],
            :count => 1
          }
        else
          cart[item_with_coupon][:count] += 1
        end
      end
    end
    #binding.pry
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item, data|
    if data[:clearance]
      data[:price] = (data[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here

  total = 0
  consolidated_cart = consolidate_cart(cart)
 
  coupon_cart = apply_coupons(consolidated_cart, coupons)

  clearance_cart = apply_clearance(coupon_cart)
  
  clearance_cart.each do |item, data|
    total += data[:price] * data[:count]
  end
  if total > 100.0
    total = total * 0.9
  end
  total
end
