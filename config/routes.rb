Rails.application.routes.draw do

  root 'spots#top'
  devise_for :users
  resources :users

  resources :spots
  resources :maps

end
