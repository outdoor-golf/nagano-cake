Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  namespace :admin do
    resources:foods,only:[:new,:create,:index,:show,:edit,:update]
    resources:genres,only:[:new,:create]
    resources:orders,only:[:index,:show,:update]
    get 'homes/top'
  end
  resources:foods,only:[:index,:show]
  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  resources:foods,only:[:new,:create,:index,:show,:edit,:update]
  resources:genres,only:[:new,:create]


  resources:orders,only:[:index,:show]
  resources:cart_foods,only:[:create,:index,:update,:destroy]
  delete :cart_foods, to: 'cart_foods#destroy_all',as:"destroy_all"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
