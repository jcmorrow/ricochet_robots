Rails.application.routes.draw do
  root 'pages#home'

  resources :boards, only: [:new, :show]
  resources :robots, only: [:new] do
    get 'move_right'
  end

end
