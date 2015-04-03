class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]
  before_action :ensure_that_signed_in, only: [:create, :destroy]

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

      if @post.save
        redirect_to discussion_path(@post.discussion_id), notice: 'Post was successfully created.'
      else
        @discussion = Discussion.find_by id: @post.discussion_id
        render template: 'discussions/show'
      end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :discussion_id, :user_id)
    end
end
