Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: "json" } do
      resources :originals, only: %i(create)
      resources :originals, only: :show, param: :contentId

      resource :secondaries, only: %i(create)
      resources :secondaries, only: :show, param: :contentId

      resources :authors, only: :show, param: :address

      get "contents", controller: "contents", action: "index"
    end
  end
end
