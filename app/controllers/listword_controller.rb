class ListwordController <ApplicationController

    def create 
        # debugger 
        if Listword.select{|listword| listword.savedword_id == listword_params[:savedword_id].to_i && listword.savelist_id == listword_params[:savelist_id].to_i }.length >= 1
            return render json: {message: 'Saved Word Already In List'}
        else 
            new_listword = Listword.create(savedword_id: listword_params[:savedword_id], savelist_id: listword_params[:savelist_id])
            render json: new_listword 
        end    
    end 

    def remove 
        target_word = Word.find(listword_params[:word_id])
        target_savelist = Savelist.find(listword_params[:savelist_id])
        target_listword = Listword.all.select{|listword| listword.savedword.word == target_word && listword.savelist == target_savelist}[0]
        if target_listword 
            target_listword.destroy 
            render json: {message: 'Word removed from list'}
        end  
    end 

    def listword_params 
        params.permit(:userkey, :savedword_id, :savelist_id, :word_id) 
    end 

end 