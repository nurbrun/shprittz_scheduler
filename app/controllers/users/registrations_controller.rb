class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

skip_before_filter :require_no_authentication, only: :create

def new
    build_resource({})
    resource.build_condo
    respond_with self.resource 
  # super
end

def create
  super
  resource.condo = Condo.where(:address => params[:user][:condo_attributes][:address]).first_or_create 
end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

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

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:email, :name, :phone, :condo_id, :password, :password_confirmation, :condo_attributes => [:address, :postal_code, :suite, :parking_spot, :user_id])
    }
  end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def resource_params
    params.require(:user).permit(:name, :email, :condo_id, :phone, :name, :password, :password_confirmation) 
  end 
end
