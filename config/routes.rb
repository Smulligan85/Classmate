Rails.application.routes.draw do
  root 'landing#index'

  get 'landing/about'

  get 'landing/contact'

end
