require 'rails_helper'

describe "User pages", type: "feature" do
    subject { page }
    let(:base_title) { "CityMix - стильная одежда" }

    describe "signup users" do
       let(:submit) { "OK" }
       before { visit signup_path }

        it { should have_content("Для доставки товара внесите Ваши данные")}
        it { should have_title("#{base_title}" +  " | Регистрация") }
        
        describe "with invalid data" do
            it "should not create a user" do
                expect { click_button submit }.not_to change(User, :count) 
            end
        end
        describe "with valid data" do
            before do
                fill_in "user[name]",                   with: "John"
                fill_in "user[last_name]",              with: "Broun"
                fill_in "user[city]",                   with: "Bruklin"
                fill_in "user[phone]",                  with: "+39012345678"
                fill_in "user[password]",               with: "Foobar"
                fill_in "user[password_confirmation]", with: "Foobar"
                fill_in "user[email]",                  with: "go@mail.ru"
            end
            it  "should be create a new user"  do
                expect { click_button submit }.to change(User, :count).by(1)
            end
        end
    end
    describe " with users profile" do
        let(:user) { FactoryGirl.create(:user) }
        before { visit user_path(user) }

        it { should have_title("Профиль пользователя: " + user.name) }
        it { should have_content("Профиль") }
    end
    describe "edit" do
        let(:user) { FactoryGirl.create(:user) }
        before { visit edit_user_path(user) }

        describe "page" do
            it { should have_title("Редагування профілю") }
            it { should have_content("Редактирование профиля") }
            it { should have_submit("Сохранить") }
        end
    end
end
