class ApplicationController < ActionController::API
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  respond_to :json

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password])
  end
end
