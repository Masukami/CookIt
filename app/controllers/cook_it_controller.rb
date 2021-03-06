class CookItController < ApplicationController
  def index
  end

  def home
    @posts = Post.all 
    @newPost = Post.new 
  end

  def profile
  	
    #grab username from url as :id
  	if (User.find_by_username(params[:id]))
  		@username = params[:id]
  	else
  		#redirect to root if user not found
  	  redirect_to root_path, :notice => "User not found"
  	end

    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new 
  end

  def explore
    @posts = Post.all
  end

  def recipes
  end

end
