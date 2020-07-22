class SavedwordController < ApplicationController

    def togglesaved 
        target_savedword = Savedword.select{|savedword| (savedword.word.location == savedword_params[:location]) && savedword.user.password_digest == savedword_params[:userkey]}[0]
        if target_savedword
            target_savedword.destroy 
            render json: {message: 'Successfully deleted'}
        else 
            target_word = Word.find_or_create_by(location: savedword_params[:location])
            target_user = User.find_by(password_digest: savedword_params[:userkey])
            new_savedword = Savedword.new(word_id: target_word.id, user_id: target_user.id) 
            if new_savedword.valid? 
                new_savedword.save 
                render json: new_savedword, include: [:word] 
            end 
        end 
    end 

    def savedword_params 
        params.permit(:userkey, :location) 
    end 

end 