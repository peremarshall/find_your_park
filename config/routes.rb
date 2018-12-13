Rails.application.routes.draw do

  resources :parks, only: [:index, :show] do
    collection do
      get :refresh
    end
  end
end
