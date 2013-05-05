class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:id])
    @posts = Post.tagged_with(params[:id])
  end
end