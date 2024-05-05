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
    actor_id = params["actor_id"]
    matching_records = Actor.where({:id => actor_id})
    the_actor = matching_records[0]
    the_actor.destroy

    redirect_to("/actors")
  end
  
  def update
    actor_id = params["actor_id"]
    matching_records = Actor.where({ :id => actor_id})
    a = matching_records[0]

    a.name = params["name"]
    a.dob = params["dob"]
    a.bio = params["bio"]
    a.image = params["image"]

    a.save

    redirect_to("/actors/#{a.id}")
  end
end
