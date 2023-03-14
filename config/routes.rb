Rails.application.routes.draw do
  get 'tips/new'

  root 'static_pages#top'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'tips_index', to: 'tips#tips_index'

  resources :users do
    resources :tips
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
