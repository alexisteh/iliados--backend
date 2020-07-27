class ListwordController <ApplicationController

    def create 
        if Listword.select{|listword| listword.savedword_id == listword_params[:savedword_id] && listword.savelist_id == listword_params[:savelist_id] }.length >= 1
            return render json: {message: 'Saved Word Already In List'}
        else 
            new_listword = Listword.create(savedword_id: listword_params[:savedword_id], savelist_id: listword_params[:savelist_id])
            render json: new_listword 
        end    
    end 

    def listword_params 
        params.permit(:userkey, :savedword_id, :savelist_id)
    end 

end 