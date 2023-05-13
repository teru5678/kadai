Rails.application.routes.draw do
  get 'chats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  get "search" => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :post_comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get 'followings' => 'relationships#follows', as: 'follows'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :chats, only: [:show,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
