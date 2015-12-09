Rails.application.routes.draw do
  root "homes#index"

  resources :blogs

  get '/blogs/test', to: "blogs#test"

end
