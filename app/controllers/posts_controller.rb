# frozen_string_literal: true

class PostsController < ApplicationController
  breadcrumb 'Home', :root_path

  def show
    @post = Post.includes(:author)
                .with_attached_featured_image
                .find(params[:id])
    @post = PostPresenter.new(@post, view_context)

    breadcrumb "Posts", root_path
    breadcrumb @post.title, post_path(@post.model)
  end
end
