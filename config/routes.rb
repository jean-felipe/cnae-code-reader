Rails.application.routes.draw do
  resources :trades

  root to: 'documentation#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
