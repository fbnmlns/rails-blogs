class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @user = current_user

    @comment = Comment.new(comment_params)
    @comment.article = @article
    @comment.user = @user
    @comment.save

    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
