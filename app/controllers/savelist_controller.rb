class SavelistController <ApplicationController


    def check
        target_user = User.find_by(password_digest: savelist_params[:userkey]) 
        lists = target_user.savelists 

        render json: lists, only: [:name, :id] 
    end 

    def savelist_params 
        params.permit(:userkey) 
    end 
end 