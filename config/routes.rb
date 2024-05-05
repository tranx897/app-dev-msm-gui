Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/insert_director_record", { :controller => "directors", :action => "create" })
  get("/delete_director/:director_id", { :controller => "directors", :action => "destroy"})
  post("/modify_director/:director_id", { :controller => "directors", :action => "update"})

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie_record", { :controller => "movies", :action => "create" })
  get("/delete_movie/:movie_id", { :controller => "movies", :action => "destroy"})
  post("/modify_movie/:movie_id", { :controller => "movies", :action => "update"})
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor_record", { :controller => "actors", :action => "create" })
  get("/delete_actor/:actor_id", { :controller => "actors", :action => "destroy"})
  post("/modify_actor/:actor_id", { :controller => "actors", :action => "update"})
end
