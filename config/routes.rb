Rails.application.routes.draw do
  root to: "furimas#index"
  devise_for :users
  resources :items, only: [:new, :create, :index] do
    #resources :comments, only: :create
    #collection do
      #get 'search'
  end
  #resources :users, only: :show 
end
