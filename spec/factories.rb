FactoryGirl.define do
    factory :user do
        name                    "Yuri2"
        email                   "yuri@example.com"
        city                    "London"
        last_name               "Petrov"
        password                "foobar"
        password_confirmation  "foobar"
        phone                  "+380981234578"
   end
end
