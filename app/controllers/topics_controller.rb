class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /forums/:forum_id/topics
  def index
    @topics = @forum.topics.includes(:user).order(created_at: :desc).page(params[:page])
  end

  # GET /forums/:forum_id/topics/1
  def show
    @posts = @topic.posts.order(created_at: :desc)
  end

  # GET /forums/:forum_id/topics/new
  def new
    @topic = @forum.topics.new
  end

  # GET /forums/:forum_id/topics/1/edit
  def edit
  end

  # POST /forums/:forum_id/topics
  def create
    @topic = @forum.topics.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to forum_topic_path(@forum, @topic), notice: 'Topic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /forums/:forum_id/topics/1
  def update
    if @topic.update(topic_params)
      redirect_to forum_topic_path(@forum, @topic), notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /forums/:forum_id/topics/1
  def destroy
    @topic.destroy
    redirect_to forum_topics_url(@forum), notice: 'Topic was successfully destroyed.'
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def topic_params
      params.require(:topic).permit(:title, :content)
    end
end
