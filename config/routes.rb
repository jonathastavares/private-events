Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :events
  resources :attendance
  resources :attendances do
    match '/join', to: 'attendances#join', via: :post, on: :collection
  end
  root 'events#index'
  get 'users/:id', :to => 'users#show', :as => :profile
  post 'events/:id', :to => 'events#attend', :as => :attend
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
