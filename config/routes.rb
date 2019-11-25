Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  resources :lessons
  resources :courses do
    get :my, :unapproved, :latest, :top_rated, :popular, on: :collection
    member do
  		patch :approve
  		patch :disapprove
    end
  end
  resources :categories
  get 'home/index'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
