module KategoriesHelper

   def check_kategory
      @kat_ctxt = Kategory.find($filter_value[1])
   end

   def filter
     @flt_kat = @kat_ctxt.filters.all    
   end
end   
