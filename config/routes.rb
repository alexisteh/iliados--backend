Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    get '/users', to: 'user#index'
    post '/users/new', to: 'user#create' 
    post '/users/login', to: 'user#login' 

    post '/words/check', to: 'word#showdetails'
    post '/words/color', to: 'word#checkcolor' 

end 
