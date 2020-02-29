class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firsst_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :birth_year, :birth_month, :birth_dey, :phone_number])
  end
end
