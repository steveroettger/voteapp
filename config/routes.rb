FacebookApp::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  #resources :admin_users

  root to: 'contestants#index'
  resources :contestants do
    member { post :vote }
  end
  match 'home', to: 'pages#home'
  resources :test_drivers
  resources :giveaway_entries
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  
end
