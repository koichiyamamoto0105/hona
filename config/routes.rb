Rails.application.routes.draw do
  devise_for :users
   scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    root 'maps#top'

    resources :users
    resources :maps do
     # get :search, on: :collection
     resource :favorites, only: [:create, :destroy]
     resources :comments, only: [:create, :destroy]
    end

    get 'users/favorites' => 'users#favorites', as: 'favorites'

  end
end
