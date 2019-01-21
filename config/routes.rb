Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'post/index'
      get 'post/create'
    end
  end
  namespace :api do
    get 'v1_post/index'
    get 'v1_post/create'
  end
  root to: 'home#index'
  get '/about', to: 'home#index'
  get '/contact', to: "home#index"

  namespace :api, format: 'json' do
    resources :tasks, only: %i(index create update)
  end
end
