Rails.application.routes.draw do
  get 'documentation/index'

  get 'trade/index'

  get 'trade/create'

  get 'trade/show'

  get 'trade/destroy'

  get 'trade/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
