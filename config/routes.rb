InstagramExample::Application.routes.draw do
  
  root to: 'users#index'

  resources :users
  
  match '/about', to: 'static_pages#about'
  
end
