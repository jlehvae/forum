class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :destroy]
  before_action :ensure_that_signed_in, only: [:create, :new]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.order('updated_at DESC').includes(:posts).all
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @post = Post.new
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = Discussion.new(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.includes(:posts, :likes).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:title, :user_id)
    end
end
