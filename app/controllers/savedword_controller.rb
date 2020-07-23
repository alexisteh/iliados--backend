class SavedwordController < ApplicationController

    def togglesaved 
        if savedword_params[:userkey] == nil 
            return render json: {error: "You Are Not Logged In"} 
        end 
        target_savedword = Savedword.select{|savedword| (savedword.word.location == savedword_params[:location]) && savedword.user.password_digest == savedword_params[:userkey]}[0]
        if target_savedword
            target_savedword.destroy 
            render json: {message: 'Successfully deleted'}
        else 
            target_word = Word.find_or_create_by(location: savedword_params[:location])
            target_word.update(content: savedword_params[:content]) 
            target_word.save  
            target_user = User.find_by(password_digest: savedword_params[:userkey])
            new_savedword = Savedword.new(word_id: target_word.id, user_id: target_user.id) 
            if new_savedword.valid? 
                new_savedword.save 
                render json: new_savedword, include: [:word] 
            end 
        end 
    end 

    def show 
        target_user = User.find_by(password_digest: savedword_params[:userkey]) 
        savedwords = Savedword.select{|savedword| savedword.user_id == target_user.id} 
        render json: savedwords, include: [:user, :word]  
    end 

    def savedword_params 
        params.permit(:userkey, :location, :content) 
    end 

end 