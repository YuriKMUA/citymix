FactoryGirl.define do
   factory :user do
        sequence(:name)         { |n| "Yuri#{n}" }
        sequence(:email)        { |n| "yuri#{n}@example.com" }
        city                    "Deli"
        sequence(:last_name)    { |n| "Petrov#{n}" }
        password                "foobar"
        password_confirmation   "foobar"
        phone                   "+380981234578"
<<<<<<< HEAD
   
        factory :admin do
            admin  true
        end
=======
        admin                   false
   end
   factory :group_tov do
        ctxt      "Мужская одежда"
        lvisible  true
>>>>>>> c032c9592f972110687d7223cab4e9b0ebbec208
   end
end
