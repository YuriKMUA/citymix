require 'rails_helper'

describe "StaticPages", :type => :feature do
    
  let(:base_title) { "CityMix - стильная одежда" }
  subject { page } 

describe "Index Page " do
    before { visit root_path }
    it { should have_content("745-85-45") }
    it { should  have_title("#{base_title}") }

  end
end
