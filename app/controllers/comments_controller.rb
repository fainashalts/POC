class CommentsController < ApplicationController
	before_action :authenticate_user!


	def create
	  @link = Link.find(params[:link_id])
	  @comment = @link.comments.new(comment_params)
	  @comment.user = current_user
		
		if @comment.save
			redirect_to link_path(@link)
		else
			render :new
		end

	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

end
