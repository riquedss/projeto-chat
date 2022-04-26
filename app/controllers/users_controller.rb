class UsersController < ApplicationController
  before_action :verify_authenticated
  before_action :is_adm_authenticated?
  before_action :set_user, only:[:show, :update, :delete]
  before_action :params_user, only:[:update, :create]
  
  def index
    @users = User.user.all 

    render json: @users, status: 200
  end

  def show
    if @user
      render json: @user, status: 200
    else
      render json: @user.errors, status: :not_found
    end
  end
  
  def create 
    @user = User.new(@params_user)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: 422
    end
    
  end
  
  def update
    if @user.update(@params_user)
      render json: @user, status: :accepted
    else
      render json: @user.errors, status: :not_found
    end
  end
  
  def delete
    if @user.destroy
      render json: @user, status: :no_content
    else
      render json: @user.errors, status: :not_found
    end
  end
  
  private
  def params_user
    @params_user = params.require(:user).permit(:name, :nickname, :password, :password_confirmation, :birth_date)
  end
  
  def set_user
    @user = User.user.find(params[:id])
  end
end