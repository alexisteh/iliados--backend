Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
    # get '/users', to: 'user#index'
    post '/users/new', to: 'user#create' 
    post '/users/login', to: 'user#login' 

    post '/words/check', to: 'word#showdetails'
    post '/words/color', to: 'word#checkcolor' 

    post '/comments/create', to: 'comment#create' 
    delete '/comments/:id', to: 'comment#delete'
    patch '/comments/:id', to: 'comment#update' 
    post '/comments/user', to: 'comment#user' 

    post '/savedwords', to: 'savedword#togglesaved'
    post '/savedwords/show', to: 'savedword#show'
    post '/savedwords/privannotations', to: 'savedword#privannotations'

    post '/savelists/check', to: 'savelist#check' 
    post '/savelists/showone', to: 'savelist#showone' 
    post '/newsavelist', to: 'savelist#new' 
    delete '/savelists/:id', to: 'savelist#delete' 

    post '/listwords', to: 'listword#create' 
    post '/listwords/remove', to: 'listword#remove'

end 
