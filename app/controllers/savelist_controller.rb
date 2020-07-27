class SavelistController <ApplicationController


    def check
        target_user = User.find_by(password_digest: savelist_params[:userkey]) 
        lists = target_user.savelists 

        render json: lists, only: [:name, :id] 
    end 

    def showone
        target_user = User.find_by(password_digest: savelist_params[:userkey]) 
        target_list = Savelist.find(savelist_params[:savelist_id]) 
        if target_list.user_id == target_user.id 
            words = target_list.listwords.sort_by{|listword| listword.created_at}.reverse.map{|listword| listword.savedword.word} 
            render json: words 
        else 
            return render json: {message: 'User Not Allowed'}
        end 
    end 

    def savelist_params 
        params.permit(:userkey, :savelist_id)  
    end 
end 