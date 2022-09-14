class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to '/'
  end

  private

  def book_params
    params.require(:book).permimt(:title,:body,:profile_image)
  end

end