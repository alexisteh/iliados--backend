class UserController <ApplicationController

    def index 
        users = User.all 
        render json: users  
    end 

    def create 
        new_user = User.new(user_params) 
        if new_user.valid?  
            new_user.save 
            render json: {message: 'Created Account!'} 
        else 
            render json: {message: 'Invalid Account Details!'} 
        end  
    end 

    def login  
        entered_user = User.find_by(username: user_params[:username])
        if entered_user
            if entered_user.authenticate(user_params[:password])  
                render json: {message: 'LoggedIn ' + entered_user.password_digest + " " + entered_user.username }  
            else 
                render json: {message: 'Incorrect Password!'}
            end 
        else
            render json: {message: 'No Such User Exists!'}
        end  
    end 


    def user_params 
        params.permit(:username, :password) 
    end 

end 