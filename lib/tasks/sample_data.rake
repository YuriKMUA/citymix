namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do
        admin = User.create!(name: "Example Name", 
                            email: "bydua@mail.ru", 
                            city: "Boston", phone: "+380982583669", 
                            password: "111111", 
                            password_confirmation: "111111", 
                            last_name: "Example Last Name", 
                            admin: true)
        99.times do |n|
            name = Faker::Name.name
            last_name = Faker::Name.last_name
            email = "example-#{n+1}@railstutorial.org"
            phone = "+390671112233"
            city = "Bruklin"
            pas = "password"
            pas_conf = "password"
            User.create!(name: name,
                         last_name: last_name,
                         email: email,
                         phone: phone,
                         city: city,
                         password: pas,
                         password_confirmation: pas_conf)
        end
    end
end
