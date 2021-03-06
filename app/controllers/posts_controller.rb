class PostsController < ApplicationController

  before_action :require_login, only: [:new, :create]

  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.all
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
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

    def require_login
      unless logged_in?
        redirect_to login_path
      end
    end
end
