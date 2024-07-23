Rails.application.routes.draw do

  devise_for :users
  root "dashboard#index"
  get 'dashboard', to: 'dashboard#index'

  # Routes for the Review resource:
  # CREATE
  post("/insert_review", { :controller => "reviews", :action => "create" })
  get("/reviews", { :controller => "reviews", :action => "index" })
  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })
  # UPDATE
  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })
  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })
end
