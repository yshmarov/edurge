Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  root to: 'home#index'

  resources :categories

  resources :courses do
    get :created, :purchased, :published_unapproved, :pending_review, :latest, :top_rated, :popular, on: :collection
    member do
  		patch :approve
  		patch :disapprove
    end
    resources :subscriptions, only: [:new, :create]
    resources :lessons
  end

  resources :subscriptions
end
