class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create

    a = Actor.new
    a.name = params["name"]
    a.dob = params["dob"]
    a.bio = params["bio"]
    a.image = params["image"]

    a.save

    # Redirect the user back to the /actors URL
    redirect_to("/actors")
  end

  def destroy
    movie_id = params["movie_id"]
    matching_records = Movie.where({:id => movie_id})
    the_movie = matching_records[0]
    the_movie.destroy

    redirect_to("/movies")
  end
  
  def update
    movie_id = params["movie_id"]
    matching_records = Movie.where({ :id => movie_id})
    m = matching_records[0]

    m.title = params["the_title"]
    m.year = params["the_year"]
    m.duration = params["the_duration"]
    m.description = params["the_description"]
    m.image = params["the_image"]
    m.director_id = params["the_director_id"]

    m.save

    redirect_to("/movies/#{m.id}")
  end
end
