class AuthController < ApplicationController
  before_action :params_user, only: [:signup]
  
  def login
    @user = User.find_by!(nickname: login_params[:nickname])

    if @user && @user.authenticate(login_params[:password])
      token = JsonWebToken::Base.encode(user_id: @user.id)
      
      render json: {token: token}, status: :ok
    else
      render json: { message: "Password or Nickname Incorrect"}, status: 401
    end
  end

  def signup
    @user = User.new(@params_user)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: 422
    end
  end

private
  def params_user
    @params_user = params.require(:user).permit(:name, :nickname, :password, :password_confirmation, :birth_date)
  end

  def login_params
    params.require(:user).permit(:nickname, :password)
  end
end
