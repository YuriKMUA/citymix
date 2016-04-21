require 'rails_helper'

describe "Authenticate Page",  type: "feature" do
     subject { page }
     before do
        visit new_session_path
      end
      let(:user) { FactoryGirl.create(:user) }
      let(:submit) { "Вход" }
      let(:enter) { "Вход в кабинет" }

    describe "with valid data" do
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
    describe "when entered admin" do
        before do
            user.admin = true
            user.save
            fill_in "session[email]",    with: user.email
            fill_in "session[password]", with: user.password
            click_button(submit)
        end
        it { should have_link("Выход" , href: signout_path) }
        it { should have_link("Пользователи", href: users_path) }
        it { should have_link("Складские операции") }

    end
end
