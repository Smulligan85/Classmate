Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :projects
  end

    resources :projects do
      resources :notes
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'landing#index'

  get 'landing/about'

  get 'landing/contact'

end
