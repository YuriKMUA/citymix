module GroupTovsHelper

   def check_group_tov
      @gr_tov_ctxt = GroupTov.find($filter_value[0])
   end
end
