Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :admins
  devise_for :customers
  resources:foods,only:[:new,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
