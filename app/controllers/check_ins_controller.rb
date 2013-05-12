class CheckInsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.find(params[:check_in][:checked_in_post_id])
    @content = params[:check_in][:content])
    current_user.check_in!(@post, @content)
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  # def destroy
  #   check_in = Check_in.find(params[:id])
  #   current_user.check_out!(check_in)
  #   respond_to do |format|
  #     format.html { redirect_to post }
  #     format.js
  #   end
  # end
end
