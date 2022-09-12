Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: "json" } do
      resource :originals, only: %i(create)
      get "contents", controller: "contents", action: "index"
      # resource :secondaries, only: %i(create)
      # resource :authors, only: %i(show)
    end
  end
end
