class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  def index
  end

  private

  def after_sign_in_path_for(resource)
    homes_about_path
  end

  def after_sign_out_path_for(resource)
    homes_about_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:post_code,:address,:phone_namber,:password,:password_confirmation])
  end
end

