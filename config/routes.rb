Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :courses do
    get :created, :purchased, :published_unapproved, :latest, :top_rated, :popular, on: :collection
    member do
  		patch :approve
  		patch :disapprove
    end
  end
  resources :subscriptions do
    get :pending_review, on: :collection
  end
  resources :lessons
  get 'home/index'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
