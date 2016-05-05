require 'rails_helper'

describe "User pages", type: "feature" do
    subject { page }
    let(:base_title) { "CityMix - стильная одежда" }
    let(:user) { FactoryGirl.create(:user) }
    
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
    describe "users profile" do
        before do
            sign_in user
            visit user_path(user)
        end

        it { should have_title("Профиль пользователя: " + user.name) }
        it { should have_content("Профиль") }
    end
    describe "edit" do
       let(:new_name) { "Steav" }
       let(:new_email) { "mynew@example.com" }
        before do
            sign_in user
            visit edit_user_path(user)
            fill_in "user[name]",     with: new_name
            fill_in "user[email]",    with: new_email
            fill_in "user[password]", with: user.password
            fill_in "user[password_confirmation]",  with: user.password
        end

        describe "page" do
            it { should have_title("Редактирование профиля") }
            it { should have_content("Редактирование профиля") }
            it { should have_button("Сохранить") }
        end
        describe "with edit data" do
            before { click_button "Сохранить" }
            it { should have_selector("div.alert.alert-success") }
            specify { expect(user.reload.name).to eq new_name }
            specify { expect(user.reload.email).to eq new_email }
        end
    end
    describe "index" do
        let(:user) { FactoryGirl.create(:user) }
        before(:each) do
            sign_in user
            visit users_path
       end
       describe "show for not admin users" do
            it { should_not have_content("Пользователи") }
            it { should have_content("Unisex")  }
       end
       describe "show admin users" do
            let(:admin) { FactoryGirl.create(:admin) }
            before do
                sign_in admin
                visit users_path
            end
            describe "pagination" do
                before(:all) { 30.times { FactoryGirl.create(:user) } }
                after(:all)  { User.delete_all }
            
                it { should have_selector("div.pagination") }
                it { should have_content("Пользователи") }
                it "should have list each user" do
                    User.paginate(page: 1).each do |user|
                        expect(page).to have_selector("li", text: user.name)
                    end
                end
            end
            describe "only admins can delete users" do
                it { should have_link("удалить", href: user_path(User.first)) }
                it { should_not have_link("удалить", href: user_path(admin)) }
                it "should able to delete the another users" do
                    expect { click_link("< удалить >", match: :first) }.to change(User, :count).by(-1)
                end
            end
       end
    end
end
