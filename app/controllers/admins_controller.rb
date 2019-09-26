class AdminsController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
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
      redirect_to root_path, notice: "建立成功!!"
    else
      render :new
    end
  end

  def show
  
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "更新成功!!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "刪除成功!!"
  end

  private
  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name ,:password, :number, :email, :role, :phone, :gender)
  end
end