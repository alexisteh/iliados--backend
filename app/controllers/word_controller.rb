class WordController < ApplicationController

    # def find_or_create 
    #     if Word.all.find_by(location: word_params[:location]) 
    #         found_word =  Word.all.find_by(location: params[:location]) 
    #         return found_word 
    #     else 
    #         new_word = Word.new(location: word_params[:location], content: word_params[:content]) 
    #         if new_word.valid? 
    #             new_word.save 
    #             return new_word 
    #         else 
    #             return null 
    #     end 
    # end 

    # def see_comments 
    #     comments = Comment.select{|comment| comment.word.location == word_params[:location] && ( comment.public == true || comment.user.password_digest == word_params[:userkey]  )}
    #     render json: comments  
    # end 

    def showdetails
        location = word_params[:location]
        comments = Comment.select{|comment| comment.word.location == location && ( comment.public == true || comment.user.password_digest == word_params[:userkey])}.sort_by(&:created_at).reverse 
        render json: comments, only: [:content, :id], include: [:user]
    end 

    def checkcolor  
        location = word_params[:location] 
        details = Comment.select{|comment| comment.word.location == location && ( comment.public == true || comment.user.password_digest == word_params[:userkey])} 
        if details.length > 0 
            render json: {message: 'highlight'}
        else 
            render json: {message: 'blank'} 
        end 
    end 

    def word_params 
        params.permit(:location, :content, :userkey) 
    end 

end 