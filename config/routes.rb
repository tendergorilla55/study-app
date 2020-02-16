Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'

  resources :expenses, only: %i[index create]
  resources :questions do
    member do
      post 'answer'
    end
  end
  resources :weight_records, only: %i[index create]

end
