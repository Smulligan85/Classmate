Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update, :show, :index, :edit] do
    resources :projects
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  resources :notes

  resources :projects

  root 'landing#index'

  get 'landing/about'

  get 'landing/contact'

end
