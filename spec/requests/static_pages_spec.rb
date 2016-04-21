require 'rails_helper'

describe "StaticPages", :type => :feature do
    
  let(:base_title) { "CityMix - стильная одежда" }
  subject { page } 

describe "Index Page " do
     before do
        @group_tov =  GroupTov.create(ctxt: "Мужская одежда", lvisible: true)
        visit root_path
     end

    it { should have_content("745-85-45") }
    it { should  have_title("#{base_title}") }
    it { should have_link("Вход", href: signin_path) }
    it { should have_link("Регистрация", href: signup_path) }
    it { should have_link(@group_tov.ctxt) }
    it { should have_link("Корзина", href: baskets_path) }
  end
end
