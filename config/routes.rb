FacebookApp::Application.routes.draw do
  
  root to: 'contestants#index'
  match 'contestants/channel.html' => 'contestants#channel', as: :contestant_channel
  resources :contestants do
    member { post :vote }
  end
  
end
