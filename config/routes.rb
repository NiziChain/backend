Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: "json" } do
      resources :originals, only: %i(show create)
      resource :secondaries, only: %i(create)
      # resource :contents, only: %i(index)
      # resource :authors, only: %i(show)
    end
  end
end
