# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     super
     @user = User.new
     @all_role = Role.all
     @user_role = @user.user_role.build

     respond_to do |format|
       format.html
       format.json {render json: @user}
     end
   end

  # POST /resource
  #  def create
  #    super
  #    params[:role_id].each do |role|
  #      if !role.empty?
  #        @user.user_role.build(:role_id => role)
  #      end
  #
  #    end
  #  end

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

  # protected
  protected
  def configure_permitted_parameters
    puts "======= params =========",params.inspect
    devise_parameter_sanitizer.permit(:sign_up ,keys: [:first_name,:last_name,:username,:email,:password,:password_confirmation,:role_id,:user_image])
    devise_parameter_sanitizer.permit(:account_update ,keys: [:first_name,:last_name,:username,:email,:password,:password_confirmation,:role_id,:user_image])
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:username,:email,:password,:password_confirmation])
  # end

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
