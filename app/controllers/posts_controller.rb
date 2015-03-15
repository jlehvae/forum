class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]
  before_action :ensure_that_signed_in, only: [:create, :destroy]

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to discussion_path(@post.discussion_id), notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: 'Post was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :discussion_id, :user_id)
    end
end
