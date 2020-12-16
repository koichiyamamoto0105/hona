Rails.application.routes.draw do

  root 'maps#top'
  devise_for :users
  resources :users
  resources :maps do
    resource :favorites, only: [:create, :destroy]
    resource :comments
    get :search, on: :collection
  end

  get 'users/favorites' => 'users#favorites', as: 'favorites'

end
