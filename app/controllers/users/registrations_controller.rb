class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

skip_before_filter :require_no_authentication, only: :create
skip_before_filter :verify_authenticity_token, :only => :create

def new
    build_resource({})
    resource.condo = Condo.new
    respond_with self.resource
end

def create
    build_resource(sign_up_params)

# Cando portion
    if Condo.find_by(:address => params[:user][:condo_attributes][:address])
      assignusertocondo = Condo.find_by(:address => params[:user][:condo_attributes][:address])
      assignusertocondo.users << resource
    end
    resource.condo = Condo.find_or_initialize_by(:address => params[:user][:condo_attributes][:address])
# End of Cando portion

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: condo_path(resource.condo.address)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end
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
      u.permit(:email, :name, :phone, :postal_code, :parking_number, :parking_level, :city, :suite, :condo_id, :password, :password_confirmation)
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
    params.require(:user).permit(:name, :email, :condo_id, :phone, :name, :postal_code, :parking_number, :parking_level, :city, :suite, :password, :password_confirmation) 
  end 
  def condo_params
    params.require(:condo).permit(:address, :postal_code, :parking_number, :parking_level, :city, :suite) 
  end 
end
