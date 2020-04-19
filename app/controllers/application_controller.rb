class ApplicationController < ActionController::Base
<<<<<<< HEAD
    add_flash_types :info, :error, :warning
=======
#     devise :database_authenticatable, :registerable,
#     :confirmable, :recoverable, :validatable
# validates_uniqueness_of :email
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :image,:image_cache])
  end
#   def serializable_hash(options = nil) 
#     super(options).merge(encrypted_password: encrypted_password) 
#   end
>>>>>>> 128e8f9d1a6830f212e5fa14182ecef0c25dc37c
end
