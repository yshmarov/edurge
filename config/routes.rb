Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  root to: 'home#index'

  resources :categories

  resources :courses do
    get :created, :purchased, :published_unapproved, :latest, :top_rated, :popular, on: :collection
    member do
  		patch :approve
  		patch :disapprove
    end
    resources :subscriptions, only: [:new, :create]
  end

  resources :subscriptions do
    get :pending_review, on: :collection
  end

  resources :lessons

end
