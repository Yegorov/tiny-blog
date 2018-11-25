# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.with_attached_featured_image.find(params[:id])
    @post = ViewPost.new(post: @post)
  end
end
