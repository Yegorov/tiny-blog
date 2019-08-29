# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.includes(:author)
                 .page(params[:page])
                 .per(5)
  end
end
