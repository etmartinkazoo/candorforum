class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.create(post_params)
    redirect_to topic_path(@topic)
  end

  def destroy
    @post.destroy
    @topic = Topic.find(params[:topic_id])
    redirect_to topic_path(@topic)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :topic_id, :user_id)
  end
end
