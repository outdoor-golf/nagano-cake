Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  namespace :admin do
    resources:foods,only:[:new,:create,:index,:show,:edit,:update]
    resources:genres,only:[:new,:create]
    resources:orders,only:[:index,:show,:update]
    get 'homes/top'
  end
  resources:foods,only:[:index]
  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :admins
  devise_for :customers
  resources:foods,only:[:new,:create,:index,:show,:edit,:update]
  resources:genres,only:[:new,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
