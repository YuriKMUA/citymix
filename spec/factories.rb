FactoryGirl.define do
    factory :user do
        name                    "Yuri"
        email                   "yuri@example.com"
        city                    "London"
        last_name               "Petrovych"
        password                "foobar"
        password_confirmation  "foobar"
        phone                  "+3801234578"
        admin                   false
    end
end
