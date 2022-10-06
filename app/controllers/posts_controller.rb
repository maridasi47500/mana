class PostsController < ApplicationController
  def show
    @post=Post.findbypath(request.path)
  end
end
