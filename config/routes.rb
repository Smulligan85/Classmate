Rails.application.routes.draw do
  devise_for :users
    resources :users, only: [:update, :show, :index]
  root 'landing#index'

  get 'landing/about'

  get 'landing/contact'

end
