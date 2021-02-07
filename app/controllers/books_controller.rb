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

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:name, :pages, :available)
  end
end
