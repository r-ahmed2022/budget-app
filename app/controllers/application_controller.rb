class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :splash_controller?
  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to categories_path, alert: 'Access denied.'
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password)
    end
  end

  private

  def splash_controller?
    instance_of?(::SplashController)
  end

  def after_sign_in_path_for(_resource)
    categories_path
  end

  def after_sign_up_path_for(_resource)
    categories_path
  end
end
