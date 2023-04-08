Rails.application.routes.draw do

  root 'static_pages#top'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/callback', to: 'sessions#google_create'
  delete '/logout', to: 'sessions#destroy'
  post '/favorite/:id', to: 'favorites#create', as: 'create_favorite'
  delete '/favorite/:id', to: 'favorites#destroy', as: 'destroy_favorite'
  get 'tips_index', to: 'tips#tips_index'
  get 'tips/how_to_street_view'

  resources :users do
    resources :tips
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
