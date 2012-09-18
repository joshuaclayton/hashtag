Hashtag::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :searches, only: [:show, :create]
end
