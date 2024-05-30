Rails.application.routes.draw do
  root "runs#index"

  resources :run_units do
    member do
      patch "indent", to: "run_units#indent"
      patch "outdent", to: "run_units#outdent"
      patch "move_up", to: "run_units#move_up"
      patch "move_down", to: "run_units#move_down"
    end
  end
  resources :runs

  get "up" => "rails/health#show", :as => :rails_health_check
end
