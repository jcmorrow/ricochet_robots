Rails.application.routes.draw do
  root 'pages#home'

  resources :boards, only: [:new, :show]
  resources :robots, only: [:new] do
    get 'move_right'
    get 'move_down'
    get 'move_left'
    get 'move_up'
  end

end
