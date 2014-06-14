Rails.application.routes.draw do
  resources :users, except: %w(new edit) do
    collection do
      post :login
      post :logout
    end
  end

  resources :services do
    resources :reports, only: %w(index create)
  end

  extend Iceburn::Routes
  iceburn_html!
end
