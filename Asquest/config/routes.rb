Rails.application.routes.draw do
  # get 'questions/index'
  # get 'questions/show'
  # get 'questions/new'
  # get 'questions/edit'
  root  'questions#index'
  resources :questions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
