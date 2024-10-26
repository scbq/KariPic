class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_photo])
  end
<<<<<<< HEAD

  def manifest
    render json: {}
  end
=======
>>>>>>> 4c1c22b6369f2a38e6d7c2e1ab0c7b58566c1cc9
end
