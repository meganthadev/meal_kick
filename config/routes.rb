Rails.application.routes.draw do
root 'sessions#home'
get '/auth/:provider/callback' => 'sessions#google'
get '/auth/failure' => 'sessions#home'

get '/users/most_recipes' => 'users#most_recipes'

get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/profile' => 'users#profile'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'

delete '/logout' => 'sessions#destroy'



  resources :recipes do 
    resources :comments, only: [:show, :new, :index, :create, :edit, :update]
  end   
  resources :categories do 
    resources :recipes, only: [:new, :create, :index, :show, :edit, :update]
  end 
  resources :comments, only: [:new, :create, :index, :show, :edit, :update]
  resources :users do 
    resources :recipes
  end 
    

  #resources :meal_weeks (stretch goal)


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end 
