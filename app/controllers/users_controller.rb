class UsersController < ApplicationController
  skip_before_filter :authenticate, :only => [:sign_in, :create]

  public
  # Returns list of users. This requires authorization

  def sign_in

    user = User.find_by_email(auth_params[:email_or_username]) || User.find_by_username(auth_params[:email_or_username])

    if user
      render json: user, serializer: LoginSerializer, status: 200
    else
      render json: {message: "Bad combination. Please try again"}, status: 401
    end

  end


  def sign_out

    user = User.find_by_email(auth_params[]) || User.find_by_username(auth_params)

    if user
      render user, status: 200
    else
      render json: {message: "Bad combination. Please try again"}, status: 401
    end

  end

  def index
    render json: User.all, each_serializer: UserSerializer
  end


  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render :json => user.to_json, :status => 201
    else
      render json: {errors: user.errors.messages}, status: 422
    end
  end

  def me
    render json: current_user, status: 200
  end

  private

# Strong Parameters (Rails 4)
  def user_params
    params.require("user").permit(:name, :username, :email, :password, :password_confirmation)
  end

# Strong Parameters (Rails 4)
  def auth_params
    params.permit(:password, :email_or_username)
  end

end
