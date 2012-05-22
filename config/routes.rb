Hashtag::Application.routes.draw do
  resources :tweets, only: [:show], path: '/'
  root to: 'tweets#index'
end
