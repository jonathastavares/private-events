Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :events
  root 'events#index'
  get 'users/:id', :to => 'users#show', :as => :profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
