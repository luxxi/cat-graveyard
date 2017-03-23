Rails.application.routes.draw do
  root "reservations#index"

  resources :reservations, only: [:index, :new, :create]

  devise_scope :customer do
    get "/login" => "devise/sessions#new"
    get "/signup" => "devise/registrations#new", as: :new_user_registration
    delete "/signout", to: "devise/sessions#destroy", as: :destroy_user_session
  end
  devise_for :customers

  mount ActionCable.server => '/cable'
end
