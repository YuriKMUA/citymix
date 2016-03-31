require 'rails_helper'

describe "User pages", type: "feature" do
    subject { page }
    let(:base_title) { "CityMix - стильная одежда" }

    describe "Signup users" do
       before { visit signup_path }

        it { should have_content("Для доставки товара внесите Ваши данные")}
        it { should have_title("#{base_title}" +  " | Регистрация") }
    end
    describe "Profile users" do 
        let(:user) { FactoryGirl.create(:user) }
        before { visit user_path(user) }

        it { should have_content("Профиль пользователя:" + user.name) }
        it { should have_menu(user.name) }
    end
end
