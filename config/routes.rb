Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get 'ui_kit', to: 'pages#ui_kit'

  resources :teams, only: [ :index, :create, :update ] do
    resources :championships, only: [ :new, :create ]
    member do
      get :join_championship
    end
  end
end
