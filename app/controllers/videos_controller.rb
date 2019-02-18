class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy, :view]

  # GET /videos
  # GET /videos.json
  def index
    @page_title = 'All videos'
    @videos = Video.where(user_id: current_user.id).order(:name).page(params[:page])
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @page_title = "Watch video - #{@video.name}"

    if @video.user.id != current_user.id
      redirect_to videos_path
    end
  end

  # GET /videos/new
  def new
    @page_title = 'Create a new video'
    @video = Video.new
    @view = 0
  end

  # GET /videos/1/edit
  def edit
    @page_title = "Edit video - #{@video.name}"
    @view = @video.view.id

    if @video.user.id != current_user.id
      redirect_to videos_path
    end
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    @view = View.create(count: 0)
    @video.view_id = @view.id

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    if @video.user.id != current_user.id
      redirect_to videos_path
    end

    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    if @video.user.id != current_user.id
      redirect_to videos_path
    end

    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # GET /videos/1/view.json
  def view
    if @video.user.id != current_user.id
      redirect_to videos_path
    end

    @view = @video.view.count + 1
    @video.view.update(count: @view)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :url, :view_id)
    end
end
