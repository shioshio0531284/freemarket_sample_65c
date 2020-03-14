# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end
  
  # POST /resource
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = { user: @user.attributes }
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @users_address = @user.build_users_address
    render :new_users_address
  end

  def create_users_address
    @user = User.new(session["devise.regist_data"]["user"])
    @users_address = UsersAddress.new(users_address_params)
    unless @users_address.valid?
      flash.now[:alert] = @users_address.errors.full_messages
      render :new_users_address and return
    end
    @user.build_users_address(@users_address.attributes)
    @user.save
    sign_in(:user, @user)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def users_address_params
    params.require(:users_address).permit(:address_first_name, :address_last_name, :address_first_name_kana, :address_last_name_kana, :post_number, :prefectures, :city, :house_number, :building_name, :address_phone_number)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
