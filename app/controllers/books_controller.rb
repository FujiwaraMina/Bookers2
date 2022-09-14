class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
     @user =  current_user
     @book = Book.find(params[:id])
     @books = Book.all
  end

  def create
    @book = Book.new (book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title,:body,:profile_image)
  end

end