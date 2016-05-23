class CookItController < ApplicationController
  def index
  end

  def home
  end

  def profile
  	#grab username from url as :id
  	#if (User.find_by_username(params[:id]) 
  		@username = params[:id]
  	#else
  		#redirect to root if user not found
  	#	redirect_to root_path, :notice => "User not found"
  	#end
  end

  def explore
  end
end
