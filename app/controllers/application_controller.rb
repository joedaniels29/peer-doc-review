class ApplicationController < ActionController::Base
  before_filter :authenticate_user_from_token!

  private

  def authenticate_user_from_token!
    authenticate_with_http_token do |tokin, options|
      User.find_by_token()
    end
  end
end