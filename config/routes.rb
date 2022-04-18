Rails.application.routes.draw do

  namespace :admin do
    resources:foods,only:[:new,:create,:index,:show,:edit,:update]
    resources:genres,only:[:new,:create,:edit,:update]
    resources:orders,only:[:index,:show,:update]
    get 'homes/top'
  end

  get 'homes/top'
  get 'homes/about',as: 'about'

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  resources:foods,only:[:new,:create,:index,:show,:edit,:update]
  resources:genres,only:[:new,:create]

  resources:cart_foods,only:[:create,:index,:update,:destroy]
  delete :cart_foods, to: 'cart_foods#destroy_all',as:"destroy_all"
  resources:addresses,only:[:new,:create,:edit,:update,:destroy]
  resources :orders, only:[:show, :create, :index, :new] do
      collection do
        post "confirm"
        get "complete"
      end
    end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
