FactoryGirl.define do
   factory :user do
        sequence(:name)         { |n| "Yuri#{n}" }
        sequence(:email)        { |n| "yuri#{n}@example.com" }
        city                    "Deli"
        sequence(:last_name)    { |n| "Petrov#{n}" }
        password                "foobar"
        password_confirmation   "foobar"
        phone                   "+380981234578"
   
        factory :admin do
            admin  true
        end
   end
end
