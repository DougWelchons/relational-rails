class LibrariesController < ApplicationController
  before_action :set_library, only: [:show, :edit, :update, :index_books]

  def index
    @libraries = Library.all
  end

  def show
    @library
  end

  def new
  end

  def create
  library = Library.new({name: params[:name],
                         city: params[:city]
  })

  library.save

  redirect_to "/libraries"
  end

  def edit
    @library
  end

  def update
    @library

    if params[:open]
      @library = Library.update(open: true)
    else
      @library = Library.update(open: false)
    end
    
    @library = Library.update(library_params)
    
    redirect_to "/libraries/#{params[:id]}"
  end

  def destroy
    Library.destroy(params[:id])
    redirect_to "/libraries"
  end

  def index_books
    @library
  end

  private
  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
    params.permit(:name, :city, :years_open, :open)
  end
end