FacebookApp::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: 'contestants#index'
  resources :contestants do
    member { post :vote }
  end
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  
end
