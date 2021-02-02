Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users

  resources :books do
    resource  :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy, :show]
  end
  resources :users,only: [:show,:index,:edit,:update]
end