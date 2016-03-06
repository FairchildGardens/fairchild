Rails.application.routes.draw do

  root to: 'dashboard#landing_page'
  get '/challenge' => 'dashboard#choose_challenge', :as => :challenge

  get '/dashboard/view_hunt'
  get '/dashboard/get_hunt_tasks'
  get '/dashboard/get_task_view'
  post '/dashboard/mark_task_as_done'

  get '/admin' => 'hunts#index'
  resources :tasks
  resources :hunts
  resources :users

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get '/search_wiki' => 'tasks#search_wiki'
end
