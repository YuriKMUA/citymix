FactoryGirl.define do
    factory :user do
        name                    "Yuri2"
        email                   "yuri@example.com"
        city                    "London"
        last_name               "Petrov"
        password                "foobar"
        password_confirmation   "foobar"
        phone                   "+380981234578"
        admin                   false
   end
   factory :group_tov do
        ctxt      "Мужская одежда"
        lvisible  true
   end
end
