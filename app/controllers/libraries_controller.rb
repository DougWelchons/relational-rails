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
    @library = Library.find(params[:id])
    @library = Library.update({name: params[:name],
                               city: params[:city]
                               })
      
    redirect_to "/libraries/#{params[:id]}"
  end

  def delete
    Library.destroy(params[:id])
    redirect_to "/libraries"
  end
end