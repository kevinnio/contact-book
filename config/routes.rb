Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts, except: :show
  devise_for :users
end
