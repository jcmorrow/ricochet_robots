Rails.application.routes.draw do
  root 'pages#home'

  resources :boards, only: [:new, :show] do
    resources :moves, only: [:create]
    get 'spaces' => 'boards#spaces'
  end
  #resources :robots, only: []

end
