class PostsController < ApplicationController
  def index
  	if params[:c_id]
  		@posts = Post.joins(:categories).where(categories: {id: params[:c_id]})
  	else
  		@posts = Post.all
  	end
  	
  end
end
