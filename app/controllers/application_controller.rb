class ApplicationController < ActionController::Base
  before_filter :authenticate

  protected
  def current_user
    @current_user;
  end
  private
  def authenticate
    authenticate_token || render_unauthorized
  end

  def render_unauthorized
    render json:{errors:'invalid or missing token!'}, status:401
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by_auth_token(token)
    end
  end
end