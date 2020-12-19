Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
   scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    root 'maps#top'

    resources :users do
      get '/favorites' => 'users#favorites', as: 'favorites'
    end
    resources :maps do
     resource :favorites, only: [:create, :destroy, :index]
     resources :comments, only: [:create, :destroy]
    end

    get '/search', to: 'search#search'



  end
end
