class LikesController < ApplicationController
  before_action :ensure_that_signed_in, only: [:create]

  def create
    post = Post.find(params[:post_id])
    positive = params[:positive]

    if post && positive
      like = Like.new(user_id: current_user.id, post_id: post.id)

      if positive == "true"
        like.positive = true
      else
        like.positive = false
      end

      like.save()
    end

    redirect_to :back
  end
end
