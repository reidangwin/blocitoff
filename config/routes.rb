Rails.application.routes.draw do
  devise_for :users

  get '/items/create'

  get '/users/show/(:id)', to: 'users#show', as: 'show_user'

  put '/users/show/(:id)', to: 'users#toggle_public', as: 'toggle_public'

  authenticated :user do
    root 'users#show'
  end

  unauthenticated :user do
    root 'welcome#index'
  end

  resources :users do
    resources :items, only: [:show, :create, :destroy, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
