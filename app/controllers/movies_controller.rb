class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    # params hash looks like this: 
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}
    # Retrieve user's input from params
    m = Movie.new
    m.title = params["the_title"]
    m.year = params["the_year"]
    m.duration = params["the_duration"]
    m.description = params["the_description"]
    m.image = params["the_image"]
    m.director_id = params["the_director_id"]

    m.save

    # Redirect the user back to the /movies URL
    redirect_to("/movies")
  end

  def destroy
    movie_id = params["movie_id"]
    matching_records = Movie.where({:id => movie_id})
    the_movie = matching_records[0]
    the_movie.destroy

    redirect_to("/movies")
  end

end
