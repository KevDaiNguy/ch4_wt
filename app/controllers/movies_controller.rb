# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
    def show
        id = params[:id] # retrieve movie ID from URI route
        @movie = Movie.find(id) # look up movie by unique ID
        # will render app/views/movies/show.<extension> by default
    end
  
    def index
      @movies = Movie.all
    end
    
    def update
        @movie = Movie.find params[:id]
        #@movie.update_attributes!(params[:movie])  # old way
        @movie.update_attributes!(movie_params)  # new way  
        flash[:notice] = "#{@movie.title} was successfully updated."
        redirect_to movie_path(@movie)
    end
    
    # add below all other methods
    private

    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
    
    def new
      @movie = Movie.new
      # default: render 'new' template
    end 
end