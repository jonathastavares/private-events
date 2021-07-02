Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :events
  resources :attendance
  resources :attendances do
    match '/join', to: 'attendances#join', via: :post, on: :collection
    match '/remove', to: 'attendances#destroy', via: :delete, on: :collection
  end
  root 'events#index'
  match 'users/:id', to: 'users#show', via: :get, as: :profile
  match 'users/events/created', to: 'users#created', via: %i[get post], as: :created_events
  match 'users/events/attended', to: 'users#attended', via: %i[get post], as: :attended_events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
