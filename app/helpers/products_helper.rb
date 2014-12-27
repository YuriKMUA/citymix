module ProductsHelper

   def check_in(product)
     self.current_product = product 
   end

   def current_product=(product)
      @current_product = product
   end

   def current_product
      @current_product = Product.find(params[:id]) 
   end

   def current_product?(product)
      product == current_product
   end

end
