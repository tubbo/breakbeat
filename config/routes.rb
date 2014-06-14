Rails.application.routes.draw do
  resources :services do
    resources :reports, only: %w(index create)
  end
end
