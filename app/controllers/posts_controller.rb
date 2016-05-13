class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.all
  end

  def create
  	@post = Post.new(post_params)
  		if @post.save
  			flash[:success] = "Succesfully created post"
  			redirect_to root_path
  		else
  			render 'new'
  		end
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :body)
  	end
end
