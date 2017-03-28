class CommentsController < ApplicationController
	before_action :comment_params, only: [:create]
	before_action :set_comment, only: [:destroy,:edit,:show, :update]
	# before_action :post_params, only: [:create]
	def index
		
	end
	def new
		@post = Post.find(params[:post_id])
		@comment= Comment.new
	end
	def create
		@comment = Comment.new(comment_params)
		@comment.post_id = params[:post_id]
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to post_path(params[:post_id])
		else
			render :new
		end

	end

	def destroy
		
		@post = Post.find(params[:post_id])
		@comment.destroy
    	respond_to do |format|
      		format.html { redirect_to post_url(@post), notice: 'Comment was successfully destroyed.' }
      		format.json { render :show, status: :ok, location: @comment }
      	end
	end

	private
	def set_comment
      @comment = Comment.find(params[:id])
    end
	def comment_params
		params.require(:comment).permit(:comment, :post_id, :user_id)
	end
	# def post_params
	# 	params.require(:comment).permit(:id)
	# end	
end
