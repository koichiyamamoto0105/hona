Rails.application.routes.draw do

  root 'maps#top'
  devise_for :users
  resources :users
  resources :maps

end
