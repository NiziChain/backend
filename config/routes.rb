Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: "json" } do
      resource :originals, only: %i(create show)
      # resource :secondaries, only: %i(create)
      # resource :contents, only: %i(index)
      # resource :authors, only: %i(show)
    end
  end
end
