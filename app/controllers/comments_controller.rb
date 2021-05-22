class CommentsController < ApplicationController
    load_and_authorize_resource
    
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      @comment.article_id = @article.id
      @comment.user_id = current_user.id
      redirect_to article_path(@article)
    end
    
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
    
    private
      def comment_params
        params.require(:comment).permit(:body, :article_id, :user_id)
      end
end
  