Rails.application.routes.draw do


  resources :campers, only: [:index, :show, :create] do
    resources :activities, only: [:index, :show]
  end

  resources :signups, only: [:create]
  resources :activities, only: [:index, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
