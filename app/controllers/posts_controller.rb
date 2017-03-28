class PostsController < ApplicationController
	before_action :post_params, only: [:create]
	before_action :set_post, only: [:destroy,:edit,:show, :update]
	before_action :authenticate_user!
	def index
		@post_all=Post.all
	end		
	
	def new

		@post=Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		respond_to do |format|
			if @post.save
				format.html { redirect_to @post, notice: 'Post was successfully created.' }
	      		format.json { render json: @post, status: :created, location: @post}
			else
				format.html { render action: "new" }
	      		format.json { render json: @post.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def destroy
		@post.destroy
    	respond_to do |format|
      		format.html { redirect_to posts_url, notice: 'post was successfully destroyed.' }
      		format.json { render :show, status: :ok, location: @post }
      	end
	end
	
	def edit
	end

	# def list
	# 	@username=post.user.username		
	# end

	def update
    	respond_to do |format|
	      	if @post.update(post_params)
	        	format.html { redirect_to @post, notice: 'post was successfully updated.' }
	        	format.json { render :show, status: :ok, location: @post }
	      	else
	        	format.html { render :edit }
	        	format.json { render json: @post.errors, status: :unprocessable_entity }
	      	end
    	end
  	end
	
	def show
		@comments = @post.comment.paginate(page: params[:page], per_page: 5).order(id: 'desc')
  	end

  	
	private

	def post_params
		params.require(:post).permit(:title, :details, :id)
	end
	def set_post
      @post = Post.find(params[:id])
    end
end
