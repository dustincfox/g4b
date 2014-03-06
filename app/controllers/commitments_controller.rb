class CommitmentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.find(params[:commitment][:commitment_id])
    current_user.commit!(@post)
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    commitment = Commitment.find(params[:id])
    post = Post.find(commitment.commitment_id)
    current_user.reneg!(commitment)
    respond_to do |format|
      format.html { redirect_to post }
      format.js
    end
  end
end