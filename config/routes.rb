Rails.application.routes.draw do
  root 'static_pages#top'

  get '/login', to: 'Sessions#new'
  post '/login', to: 'Sessions#create'
  delete '/logout', to: 'Sessions#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
