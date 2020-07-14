Rails.application.routes.draw do
root "sessions#home"

get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'

delete '/logout' => 'sessions#destroy'


  resources :categories do 
    resources :recipes, only: [:new, :create, :index]
  end 
  resources :comments
  resources :users do 
    resources :recipes
  end 
  resources :recipes
  resources :recipes do 
    resources :comments
  end   

  #resources :meal_weeks (stretch goal)


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end 
