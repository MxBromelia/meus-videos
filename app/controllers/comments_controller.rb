class CommentsController < ApplicationController
  before_action :set_video, only: %i[create]
  before_action :set_comment, only: %i[destroy]

  def create
    @video.comments.build(params_comment)

    if @video.save
      redirect_to video_path(@video)
    end
  end

  def destroy
    @video = @comment.video
    if @comment.destroy
      redirect_to video_path(@video)
    end
  end

  private

  def params_comment
    params.require(:comment).permit(:message)
  end

  def set_video
    @video = Video.find(params[:video_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
