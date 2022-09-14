class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
  end

  def index
    @user =  current_user
    @users = User.all
    @books = Book.all
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
