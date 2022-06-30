Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations",
                                   sessions: "users/sessions"}

  root "static_page#index"

  resources :shops do
    resources :reviews
  end
  resources :benefits
  resources :pts

end
