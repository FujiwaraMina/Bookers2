class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @user =  current_user
    @books = Book.all
    @book = Book.new
  end

  def show
     @user =  current_user
     @book = Book.find(params[:id])
     @book_new = Book.new
     @books = Book.all
  end

  def create
    @user =  current_user
    @book = Book.new (book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @user =  current_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title,:body,:profile_image)
  end

end