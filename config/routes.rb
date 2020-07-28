Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
    # get '/users', to: 'user#index'
    post '/users/new', to: 'user#create' # CREATE user profile 
    post '/users/login', to: 'user#login' # log in user 

    post '/words/check', to: 'word#showdetails' # GET annotations associated with word 
    # post '/words/color', to: 'word#checkcolor' 

    post '/comments/user', to: 'comment#user'  # GET comments associated with user 
    post '/comments/create', to: 'comment#create' # CREATE new commment 
    delete '/comments/:id', to: 'comment#delete' # DELETE comment 
    patch '/comments/:id', to: 'comment#update' # UPDATE comment 

    patch '/savedwords', to: 'savedword#togglesaved' # UPDATE whether word is saved or not 
    post '/savedwords/show', to: 'savedword#show' # GET saved words associated with user 
    # post '/savedwords/privannotations', to: 'savedword#privannotations' # 

    post '/savelists/check', to: 'savelist#check' # GET savelists associated with user 
    post '/savelists/showone', to: 'savelist#showone' # GET words in one savelist 
    post '/newsavelist', to: 'savelist#new' # CREATE savelist 
    delete '/savelists/:id', to: 'savelist#delete' # DELETE savelist 

    post '/listwords', to: 'listword#create' # CREATE listword 
    post '/listwords/remove', to: 'listword#remove' # DELETE listword 

end 
