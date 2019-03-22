Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts
  devise_for :users
end
