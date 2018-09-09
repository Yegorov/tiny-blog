class HomeController < ApplicationController
  def index
    user = User.first
    @posts = user.posts
  end
end
