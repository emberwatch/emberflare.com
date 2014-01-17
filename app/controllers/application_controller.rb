class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= begin
      env = request.env["HTTP_AUTHORIZATION"]
      if env
        User.find_by(:token => env[/\w+\Z/])
      end
    end
  end
end
