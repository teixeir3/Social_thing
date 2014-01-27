class PostsController < ApplicationController
  def new
    @post = Post.new
    3.times { @post.links.build }
  end

  def create
    @post = Post.new(params[:post])
    @post.author_id = current_user.id
    @post.links.new(params[:link].values)
    @post.post_shares.new(params[:post_share].values)
    fail
    @post.save


    redirect_to user_url(@post.author_id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
