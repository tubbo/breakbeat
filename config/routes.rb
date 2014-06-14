Rails.application.routes.draw do
  extend Iceburn::Routes

  resources :services do
    resources :reports, only: %w(index create)
  end

  iceburn_html!
end
