class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def create
    d = Director.new
    d.name = params["name"]
    d.dob = params["dob"]
    d.bio = params["bio"]
    d.image = params["image"]

    d.save

    # Redirect the user back to the /directors URL
    redirect_to("/directors")
  end

  def destroy
    director_id = params["director_id"]
    matching_records = Director.where({:id => director_id})
    the_director = matching_records[0]
    the_director.destroy

    redirect_to("/directors")
  end
  
  def update
    director_id = params["director_id"]
    matching_records = Director.where({ :id => director_id})
    d = matching_records[0]

    d.name = params["name"]
    d.dob = params["dob"]
    d.bio = params["bio"]
    d.image = params["image"]

    d.save

    redirect_to("/directors/#{d.id}")
  end
end
