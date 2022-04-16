Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  namespace :admin do
    resources:foods,only:[:new,:create,:index,:show,:edit,:update]
    resources:genres,only:[:new,:create]
    get 'homes/top'
  end
  resources:foods,only:[:index,:show]
  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :admins
  devise_for :customers
  resources:orders,only:[:index,:show]
  resources:cart_foods,only:[:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
