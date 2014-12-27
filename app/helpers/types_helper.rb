module TypesHelper

   def check_type
       @types = Type.where(kategories_id: $filter_value[1])

   end

end
