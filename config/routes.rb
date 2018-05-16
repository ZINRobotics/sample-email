Rails.application.routes.draw do
  resources :templates
  get "/", to: "templates#email"
  post "/send_email", to: "templates#send_email"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
