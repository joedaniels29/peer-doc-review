class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      user.update_token

      render json:User, status:201
    else
      flash.now[:warning] = "Invalid email or password"
      head 401
    end
  end

  def destroy

  end
end