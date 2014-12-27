class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include GroupTovsHelper
  include KategoriesHelper
  include TypesHelper
  include ProductsHelper

  # Force Signout to prevent CSRF attacks
  def handle_unverified_request
    sing_out
    super
  end
end
