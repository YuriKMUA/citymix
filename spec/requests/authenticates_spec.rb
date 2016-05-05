require 'rails_helper'

describe "Authenticate Page",  type: "feature" do
    before do
      visit new_session_path
    end
    let(:user) { FactoryGirl.create(:user) }
    let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
    let(:submit) { "Вход" }
    let(:enter) { "Вход в кабинет" }
    subject { page }

    describe "with valid data non admin users" do
        before do
            fill_in "session[email]",    with: user.email
            fill_in "session[password]", with: user.password
            click_button(submit)
        end
        it { should have_link("Выход" , href: signout_path) }
        it { should_not have_link("Вход", href: signin_path) }
        it { should_not have_link("Пользователи", href:users_path) }
        it { should have_link("Корзина") }
    end
    describe "should be valid" do
        before { click_button(submit) }
            it { should have_selector("div.alert.alert-danger") }
            it { should have_title(enter) }
            it { should have_content(enter) }
    end
    describe "when sign in admin" do
        before do
            user.update_attribute(:admin, true)
            fill_in "session[email]",    with: user.email
            fill_in "session[password]", with: user.password
            click_button(submit)
        end
        describe "should have" do
            it { should have_link("Выход" , href: signout_path) }
            it { should have_link("Пользователи", href: users_path) }
            it { should have_link("Складские операции") }
        end
        describe "should have edit profile" do
            before { visit edit_user_path(user) }
            it { should have_title("Редактирование профиля") }
            it { should have_content("Редактирование профиля") }
            it { should have_button("Сохранить") }
        end
    end
    describe "when non authenticate admin", type: "request" do
        before { patch user_path(user) }
        specify { expect(response).to redirect_to(signin_path) }
    end
    describe "as wrong user", type: "request" do
        before { sign_in user, no_capybara: true }
        
        describe "submiting a  GET request to User#edit action" do
            before { get edit_user_path(wrong_user) }
    
            specify { expect(response.body).not_to match("Редактирование профиля") }
            specify { expect(response).to redirect_to(root_path) }
        end
        describe "submiting a PATCH request to User#update action" do
            before { patch user_path(wrong_user) }

            specify { expect(response).to redirect_to(root_path) }
        end
    end
    describe "submiting a DELETE request to User#destroy action" , type: "request" do
        let(:non_admin) { FactoryGirl.create(:user) }
        before do
            sign_in non_admin, no_capybara: true
#            visit users_path
            delete user_path(non_admin)
        end
            specify { expect(response.body).not_to match("Пользователи") }
            specify { expect(response).to redirect_to(root_path) }
    end
end
