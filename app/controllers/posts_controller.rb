class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_param)
		@post.user_id = current_user.id
		respond_to do |f|
			if (@post.save)
				f.html { redirect_to "", notice: "Recipe Posted!" }
			else
				f.html { redirect_to "", notice: "Error! Post Failed"}
			end
		end
	end

	private
	def post_param #allow certain data to be passed using form
		params.require(:post).permit(:user_id, :title, :description, :image)
	end


end