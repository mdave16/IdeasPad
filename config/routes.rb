Rails.application.routes.draw do
  root to: 'sessions#new'

  post "/auth/:provider/callback", to: "sessions#create"
  post 'auth/failure', to: redirect('/')

  delete 'signout', to: 'sessions#destroy', as: 'signout'

  resources :ideas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
