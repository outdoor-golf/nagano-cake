Rails.application.routes.draw do

  namespace :admin do

  end

  devise_for :admins
  devise_for :customers
  resources:foods,only:[:new,:create,:index]
  resources:orders,only:[:index,:show,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
