Rails.application.routes.draw do
  root 'pages#home'

  resources :boards, only: [:create]

  resources :solutions, only: [:create, :show] do
    resources :moves, only: [:create]
    resource :copy, only: [:create], controller: "solution_copies"
  end

  #resources :robots, only: []

end
