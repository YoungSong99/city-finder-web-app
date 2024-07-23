Rails.application.routes.draw do
  devise_for :users
  root "cities#index"

  # Routes for the School grade resource:
  # CREATE
  post("/insert_school_grade", { :controller => "school_grades", :action => "create" })
          
  # READ
  get("/school_grades", { :controller => "school_grades", :action => "index" })
  
  get("/school_grades/:path_id", { :controller => "school_grades", :action => "show" })
  
  # UPDATE
  
  post("/modify_school_grade/:path_id", { :controller => "school_grades", :action => "update" })
  
  # DELETE
  get("/delete_school_grade/:path_id", { :controller => "school_grades", :action => "destroy" })

  #------------------------------

  # Routes for the Appreciation value resource:

  # CREATE
  post("/insert_appreciation_value", { :controller => "appreciation_values", :action => "create" })
          
  # READ
  get("/appreciation_values", { :controller => "appreciation_values", :action => "index" })
  
  get("/appreciation_values/:path_id", { :controller => "appreciation_values", :action => "show" })
  
  # UPDATE
  
  post("/modify_appreciation_value/:path_id", { :controller => "appreciation_values", :action => "update" })
  
  # DELETE
  get("/delete_appreciation_value/:path_id", { :controller => "appreciation_values", :action => "destroy" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  post("/insert_review", { :controller => "reviews", :action => "create" })
          
  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  
  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })
  
  # UPDATE
  
  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })
  
  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })

  #------------------------------

  # Routes for the Crime rate resource:

  # CREATE
  post("/insert_crime_rate", { :controller => "crime_rates", :action => "create" })
          
  # READ
  get("/crime_rates", { :controller => "crime_rates", :action => "index" })
  
  get("/crime_rates/:path_id", { :controller => "crime_rates", :action => "show" })
  
  # UPDATE
  
  post("/modify_crime_rate/:path_id", { :controller => "crime_rates", :action => "update" })
  
  # DELETE
  get("/delete_crime_rate/:path_id", { :controller => "crime_rates", :action => "destroy" })

  #------------------------------

  # Routes for the City resource:

  # CREATE
  post("/insert_city", { :controller => "cities", :action => "create" })
          
  # READ
  get("/cities", { :controller => "cities", :action => "index" })
  
  get("/cities/:path_id", { :controller => "cities", :action => "show" })
  
  # UPDATE
  
  post("/modify_city/:path_id", { :controller => "cities", :action => "update" })
  
  # DELETE
  get("/delete_city/:path_id", { :controller => "cities", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
