Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'

  resources :expenses
  resources :questions

  namespace :api, {format: 'json'} do
    resources :questions, only: %i(index)
  end
end
