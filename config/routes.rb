Rails.application.routes.draw do
  root "runs#index"

  resources :run_units
  resources :runs

  get "up" => "rails/health#show", :as => :rails_health_check
end
