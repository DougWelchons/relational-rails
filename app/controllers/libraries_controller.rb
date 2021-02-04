class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
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
    @library = Library.find(params[:id])
  end

  def update
    require 'pry'; binding.pry
    @library = Library.find(params[:id])
    @library = Library.update({name: params[:name],
                              city: params[:city]
                              })

    redirect_to 
  end
end