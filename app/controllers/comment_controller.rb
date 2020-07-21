class CommentController < ApplicationController


    def create 
        if comment_params[:userkey] == nil 
            return render json: {error: 'not logged in'}
        end 
        tagged_word = Word.find_or_create_by(location: comment_params[:location])
        tagged_user = User.find_by(password_digest: comment_params[:userkey])
        if comment_params[:privacy] == "public"
            public = true 
        else 
            public = false 
        end 
        new_comment = Comment.new(word_id: tagged_word.id, user_id: tagged_user.id, public: public, content: comment_params[:content])
        if new_comment.valid? 
            new_comment.save 
            render json: new_comment, only: [:content, :id], include: [:user] 
        else 
            return render json: {error: 'invalid comment'} 
        end  
    end 

    def comment_params 
        params.permit(:content, :location, :userkey, :privacy) 
    end 

end 