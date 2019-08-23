class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_user
    current_user = User.find_by(id: session[:user_id])
  end



  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :zipcode, :address, :apartment])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :zipcode, :string, :apartment])
    end

    def after_sign_out_path_for(resource)
    '/users/sign_in' #サインアウト後はログイン画面に遷移
    end


end
