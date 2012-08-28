FacebookApp::Application.routes.draw do
  
  root to: 'contestants#index'
  match 'contestants/channel.html' => 'contestants#index', :as => :contestants_channel
  resources :contestants do
    member { post :vote }
  end
  
end
