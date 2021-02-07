class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  def index
    @books = Book.all
  end

  def show
    @book
  end

  def edit
    @book
  end
  
  def update
    @book = Book.update(book_params)
    
    redirect_to "/books/#{params[:id]}"
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to "/books"
  end
  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:name, :pages, :available)
  end
end
