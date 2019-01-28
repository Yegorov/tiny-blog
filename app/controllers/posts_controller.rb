# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.includes(:author)
                .with_attached_featured_image
                .find(params[:id])
    @post = PostPresenter.new(@post, view_context)
  end
end
