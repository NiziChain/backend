Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: "json" } do
      resources :originals, only: %i(create)
      resources :originals, only: :show, param: :contentId

      resource :secondaries, only: %i(create)
      resources :secondaries, only: :show, param: :contentId

      get "contents", controller: "contents", action: "index"
      # resource :contents, only: %i(index)
      # resource :authors, only: %i(show)
    end
  end
end
