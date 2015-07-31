class Admin::CommentsController < AdminController
  def create
    contact = Contact.find params[:contact_id]
    @comment = contact.comments.build comment_params
    @comment.save
    redirect_to :back
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit!
  end
end