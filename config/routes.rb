Rails.application.routes.draw do
<<<<<<< HEAD
  
=======
  namespace :admin do
    get 'homes/top'
  end
  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'
>>>>>>> origin/develop
  devise_for :admins
  devise_for :customers
  resources:foods,only:[:new,:create,:index,:show,:edit,:update]
  resources:genres,only:[:new,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
