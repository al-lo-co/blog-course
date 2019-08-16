Rails.application.routes.draw do

  get 'contacts/new'
  get 'contacts/create'
  get 'articles/search'
  devise_for :users
  resources :contacts, only: [:new, :create]
  resources :categories
  resources :articles do
  	resources :comments
  end
  root 'articles#index'

end
