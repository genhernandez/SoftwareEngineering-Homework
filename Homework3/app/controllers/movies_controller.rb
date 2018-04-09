class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    #March 8 HW2 1 & 2 - Sort movies by selected header
    # and determine which movies should be shown based on ratings
    @all_ratings = Movie.order(:rating).select(:rating).map(&:rating).uniq
    @checked_ratings = check
    @checked_ratings.each do |rating|
      params[rating] = true
    end
      @movies = Movie.order(params[:sort])
      @movies = @movies.where(:rating => @checked_ratings)
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  #March 8 HW2 2 - added check method to determine which ratings should be shown
  private
  def check
    if params[:ratings]
      params[:ratings].keys
    else
      @all_ratings
    end
  end

      def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date, :timestamps)
    end

end