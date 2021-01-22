Rails.application.routes.draw do
  get 'search/search'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    root 'maps#top'

    devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

    resources :users, except: [:index, :destroy] do
      member do
        get '/favorites' => 'users#favorites', as: 'favorites'
      end
    end
    resources :maps do
      collection do
        get 'country'
      end
      resource :favorites, only: [:create, :destroy, :index]
      resources :comments, only: [:create, :destroy, :index]
    end

    get '/comment/hashtag/:name', to: "comments#hashtag"
    get '/comment/hashtag', to: "comments#hashtag"
    get '/search', to: 'search#search'

  end
end
