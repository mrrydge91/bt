class Product < ActiveRecord::Base

def price
    pricepoint123=Product.pluck(:pricepoint)
     i = 0 
    membership = [] 
    location123 = pricepoint123.split("-") 
    location123.map!.with_index { |x, i| {i => x}} 

until i >= location123.length 
  membership += location123[i][i].split("~") 
  i += 1 
end
  membership.map!.with_index{|x, i| {i =>x}} 



pp = [] 
i=0 
 
 until i >= membership.length 
   pp += membership[i][i].split(":") 
 end 



i=1 

until i >= pp.length 
  pp[i].gsub!(/;/, "\n") 
  i += 2 
end

pp
  end

	
end
