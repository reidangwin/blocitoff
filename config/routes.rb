Rails.application.routes.draw do
  devise_for :users

  get 'users/show'

  authenticated :user do
    root 'users#show'
  end

  unauthenticated :user do
    root 'welcome#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users/show/:id', to: 'users#show', as: 'show_user'
end
