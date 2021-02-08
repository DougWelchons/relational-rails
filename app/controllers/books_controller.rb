class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  def index
    if params[:id]
      @library = Library.find(params[:id])
      @books = @library.books.search(params[:search])
    elsif params[:seach]
      @books = Book.search(params[:seach])
    else
      @books = Book.available_books
    end
  end

  def show
    @book
  end

  def edit
    @book
  end

  def new
    @library = Library.find(params[:id])
  end

  def create
    @library = Library.find(params[:id])

    @library.books.create!(book_params)

    redirect_to "/libraries/#{@library.id}/books"
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
    params.permit(:name, :pages, :available, :search)
  end
end
