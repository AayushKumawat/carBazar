Rails.application.routes.draw do
  get 'sells/index'
  get 'enquiry/index'
  get 'reviews/index'
  get 'profiles/index'
  get 'likes/create'
  get 'cars/index'
  get 'homes/index'
  root'homes#index'
  devise_for :users
  resources :cars do
  resources :likes
  get 'cars/buy'
end
resources :likes
resources :profiles
resources :reviews
resources :enquiries
resources :sells
end
