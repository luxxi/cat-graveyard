Rails.application.routes.draw do
  devise_scope :customer do
    get "/login" => "devise/sessions#new"
    get "/signup" => "devise/registrations#new", as: "new_user_registration"
  end
  devise_for :customers
end
