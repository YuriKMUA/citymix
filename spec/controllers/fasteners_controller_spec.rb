require 'spec_helper'

describe FastenersController do

  describe "GET 'products'" do
    it "returns http success" do
      get 'products'
      response.should be_success
    end
  end

end
