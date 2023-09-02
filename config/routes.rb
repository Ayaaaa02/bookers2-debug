Rails.application.routes.draw do
    devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "homes#top"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  
  get "home/about"=>"homes#about",as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end