Rails.application.routes.draw do
  devise_for :users

  resources :events do
    resources :attendances, only: [:new, :create]
  end

  root to: "events#index"
end
