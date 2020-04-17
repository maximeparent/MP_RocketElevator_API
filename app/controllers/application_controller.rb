class ApplicationController < ActionController::Base
  # before_action :session_expiry
  # before_action :update_activity_time

    protect_from_forgery

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      added_attrs = [:username, :email, :company, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  #   def session_expiry

  #     get_session_time_left
  #     unless @session_time_left > 0
  #       flash.now[:error] = "Your session has timed out. Please log back in."
  #       sign_out
  #     end
  #  end
   
  #  def get_session_time_left 
   
  #     expire_time = session[:expires_at] || Time.now  
  #     @session_time_left = (expire_time.to_i   - Time.now.to_i)
  #  end
   
  #  def update_activity_time
  #    session[:expires_at] = 1.minutes.from_now
#    end
# end
