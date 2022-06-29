Rails.application.routes.draw do
  resources :benefits

  devise_for :users, controllers: {registrations: "users/registrations",
                                   sessions: "users/sessions"}

  root "static_page#index"

  resources :shops do
    resources :reviews
  end
end
