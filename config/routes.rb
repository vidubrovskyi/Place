Rails.application.routes.draw do
  resources :prices

  devise_for :users, controllers: {registrations: "users/registrations",
                                   sessions: "users/sessions"}

  root "static_page#index"

  resources :shops do
    resources :reviews

    collection do
      post :index
    end

    member do
      patch :vote
      get :hovercard
    end
  end

  resources :benefits
  resources :pts

end
