class HeartsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post
	before_action :set_heart
  	def create

    	@like = Heart.new(user_id: current_user.id, post_id: params[:post_id].to_i)
    	
    	@like.save
    	

    	respond_to do |format|
	      	format.html { redirect_to posts_url, notice: 'post was successfully liked.' }
      		format.json { render :show, status: :ok, location: @post }
    	end
  	end

  	def destroy
  		@heart = Heart.where(user_id: current_user.id, post_id: params[:post_id]).destroy_all
    	

    	respond_to do |format|
	      	format.html { redirect_to posts_url, notice: 'post was successfully unliked.' }
      		format.json { render :show, status: :ok, location: @post }
    	end
  	end

  	private

    def set_post
    	@post = Post.find(params[:post_id])
    end
    def set_heart
    	@heart=Heart.where(user_id: current_user.id, post_id: params[:post_id]).first
    end
end
