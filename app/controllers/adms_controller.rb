class AdmsController < ApplicationController
  before_action :verify_authenticated
  before_action :is_adm_authenticated?
  before_action :set_user,  only: [:show, :update, :delete]
  before_action :params_adm, only: [:update, :create]
  
  def index
    @adms = User.adm.all 

    render json: @adms, status: 200
  end

  def show
    if @adm
      render json: @adm, status: 200
    else
      render json: @adm.errors, status: :not_found
    end
  end

  def create
    @params_adm[:kind] = 1

    @adm = User.new(@params_adm)
    if @adm.save
      render json: @adm, status: :created
    else
      render json: @adm.errors, status: 422
    end

  end

  def update
    if @adm.update(params_user)
      render json: @adm, status: :accepted
    else
      render json: @adm.errors, status: :not_found
    end
  end

  def delete
    if @adm.destroy
      render json: @adm, status: :no_content
    else 
      render json: @adm.errors, status: :not_found
    end
  end

  private
  def params_adm
    @params_adm = params.require(:user).permit(:name, :nickname, :password_digest, :birth_date)
  end

  def set_adm
    @adm = User.adm.find(params[:id])
  end
end