Rails.application.routes.draw do
  get 'conversations/create'

  get 'conversations/show'

  devise_for :users

  resources :users do
    resources :projects
  end

  resources :projects do
    resources :notes
  end

  resources :conversations do
    resources :messages
  end

  resources :events

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'landing#index'

  get 'landing/about'

  get 'landing/contact'

end
