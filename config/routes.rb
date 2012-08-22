FacebookApp::Application.routes.draw do
  
  root to: 'contestants#index'
  resources :contestants do
    member { post :vote }
  end
  
end
