class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :continue_test, except: [:create,:submit_test,:paper]
before_action :authenticate_user!
private
     
  def continue_test
    if session[:test_url] != nil && session[:test_url] != request.original_url
      redirect_to session[:test_url]
    end
  end
  protected

  def configure_permitted_parameters
    # fail
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    
  end

end
