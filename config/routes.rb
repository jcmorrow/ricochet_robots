Rails.application.routes.draw do
  root 'pages#home'

  resources :boards, only: [:new]
end
