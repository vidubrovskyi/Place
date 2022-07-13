Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations",
                                   sessions: "users/sessions"}

  root "static_page#index"

  resources :shops do
    resources :reviews

    collection do
      post :index
      post :create_shop, to: "shops#create", as: :create
    end

    member do
      patch :vote
      get :hovercard
    end
  end

  resources :benefits
  resources :pts
  resources :prices

  resources :stocks do
    collection do
      post :index
      post :create_stock, to: "stocks#create", as: :create
    end
  end
  resources :hits do
    collection do
      post :index
      post :create_hit, to: "hits#create", as: :create
    end
  end
  resources :contacts

end
