module KategoriesHelper

   def check_kategory
      @kat_ctxt = Kategory.find($filter_value[1])
   end

end   
