class ApplicationController < ActionController::Base
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
end
