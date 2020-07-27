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

    def new 
        target_user = User.find_by(password_digest: savelist_params[:userkey]) 
        if (savelist_params[:name] != "") && target_user 
            new_savelist = Savelist.create(name: savelist_params[:name], user_id: target_user.id) 
            render json: new_savelist 
        end 
    end 

    def delete 
        target_savelist = Savelist.find(savelist_params[:id])
        target_savelist.destroy 
        render json: {message: 'Successfully deleted'}  
    end 

    def savelist_params 
        params.permit(:userkey, :savelist_id, :name, :id)   
    end 
end 