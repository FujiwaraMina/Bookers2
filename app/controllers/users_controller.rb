class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_id =  current_user
    @users = User.all
    @books = @user.books
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
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
