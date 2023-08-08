class SplashController < ApplicationController
  def index; end

  private

  def redirect_authenticated_user
    redirect_to categories_path if user_signed_in?
  end
end
