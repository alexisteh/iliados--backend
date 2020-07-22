class CommentController < ApplicationController

    def create 
        if comment_params[:userkey] == nil 
            return render json: {error: 'Log in to annotate text'}
        end 
        tagged_word = Word.find_or_create_by(location: comment_params[:location])
        tagged_user = User.find_by(password_digest: comment_params[:userkey])
        if comment_params[:privacy] == "Public"
            public_set = true 
        else 
            public_set = false 
        end 
        new_comment = Comment.new(word_id: tagged_word.id, user_id: tagged_user.id, public: public_set, content: comment_params[:content])
        if new_comment.valid? 
            new_comment.save 
            render json: new_comment, only: [:content, :id], include: [:user, :word]  
        else 
            return render json: {error: "Don't make empty comments, you loon!"} 
        end  
    end 

    def update 
        target_comment = Comment.find(comment_params[:id]) 
        target_comment.update(content: comment_params[:content])
        if comment_params[:privacy] == "Public"
            public_set = true 
        else 
            public_set = false 
        end 
        target_comment.update(public: public_set)  
        if target_comment.valid? 
            target_comment.save 
            render json: target_comment, only: [:content, :id], include: [:user, :word] 
        else
            render json: {error: 'Invalid Content'} 
        end 
    end 

    def delete 
        Comment.find(comment_params[:id]).destroy 
        render json: {message: 'destroyed'}
    end 

    def comment_params 
        params.permit(:content, :location, :userkey, :privacy, :id) 
    end 

end 