class VideosController < ApplicationController

  before_action :set_category, only: %i[new create]
  before_action :set_video, only: %i[show edit update destroy]

  def new
    @video = @category.videos.build
  end

  def create
    @video = Video.new(params_video)

    if @video.save
      redirect_to video_path(@video), notice: "Vídeo Adicionado com Sucesso"
    else
      render :new
    end
  end

  def show
    @video_comments = @video.comments.order(created_at: :desc)
    @comment = @video.comments.build
  end

  def destroy
    category = @video.category
    if @video.destroy
      redirect_to category_path(category), status: :ok
    end
  end

  private

  def params_video
    params.require(:video).permit(:url, :title).merge(category: @category)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_video
    @video = Video.find(params[:id])
  end
end
