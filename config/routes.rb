Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Main root
  root 'main#index'
  # Users path
  get '/:username', to: 'users#show', as: 'user'
  patch '/:username', to: 'users#update'
  # Tweet Creation
  resources :tweets, only: [:new, :create]
  # Followers & Following from user
  scope "/:username" do
    resources :followers, param: :username, only: :index, as: 'user_followers'
    resources :following, param: :username, only: :index, as: 'user_following'
  end
  # Following & Unfollowing new users
  resources :following, param: :username, only: [:new, :create, :destroy]
end
