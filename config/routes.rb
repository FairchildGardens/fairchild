Rails.application.routes.draw do

  root to: 'dashboard#landing_page'
  get '/challenge' => 'dashboard#choose_challenge', :as => :challenge

  resources :tasks
  resources :hunts
  resources :users

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
