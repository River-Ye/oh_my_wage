class Admin::UsersController < ApplicationController
  before_action :check_login
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.search(params[:search]).admin_order.page(params[:page])
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'users/pdf',pdf:'pdf'}   
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/', notice: "建立成功!!"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @student = Salary.new
  end

  def update
    if @user.update(user_params)
      redirect_to '/', notice: "更新成功!!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to '/', notice: "刪除成功!!"
  end

  private
  
  def find_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :number, :email, :role, :phone, :gender, :password)
  end

  def check_login
    redirect_to '/', notice: "權限不足!!" unless user_signed_in? && current_user.role == 'admin'
  end
end