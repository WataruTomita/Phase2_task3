Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show] do
    resource  :favorites, only: [:create, :destroy]
  end
  resources :users,only: [:show,:index,:edit,:update]
  resources :books

end