class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]

  # GET /forums
  def index
    @forums = Forum.order(:name).page params[:page]
  end

  # GET /forums/1
  def show
  end

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  def create
    @forum = Forum.new(forum_params)

    if @forum.save
      redirect_to @forum, notice: 'Forum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /forums/1
  def update
    if @forum.update(forum_params)
      redirect_to @forum, notice: 'Forum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /forums/1
  def destroy
    @forum.destroy
    redirect_to forums_url, notice: 'Forum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forum_params
      params.require(:forum).permit(:name, :description, :user_ids[])
    end
end
