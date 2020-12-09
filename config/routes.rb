Rails.application.routes.draw do
  root to: "furimas#index"
  devise_for :users
  resources :items, only: [:new, :create, :index, :show, :edit, :destroy, :update] do

  end
end
