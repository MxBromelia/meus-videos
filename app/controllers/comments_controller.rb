class CommentsController < ApplicationController
  before_action :set_video, only: %i[create]
  before_action :set_comment, only: %i[destroy]

  def create
    @video.comments.build(params_comment)

    if @video.save
      render json: {}, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
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
