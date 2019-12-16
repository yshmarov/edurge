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
    resources :lessons do
      put :sort
    end
  end

  resources :subscriptions do
    get :my_students, on: :collection
    member do
  		patch :remove_review
    end
  end

  resources :users, only: [:show, :index]

  resources :lessons do
    put :sort
  end

end