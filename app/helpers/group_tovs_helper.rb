module GroupTovsHelper

   def check_group_tov
      @gr_tov_ctxt = GroupTov.find($filter_value[0])
   end

   def filter
     @flt_kat = @gr_tov_ctxt.filters.all    
   end

end
