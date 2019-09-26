class AdminsController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
    @users = User.all
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