class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:comment][:text])
    ActionCable.server.broadcast 'comment_channel', content: @comment if @comment.save
  end
end
