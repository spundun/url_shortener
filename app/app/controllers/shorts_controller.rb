class ShortsController < ApplicationController
  before_action :set_short, only: [:show, :destroy, :point]

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found_redirect

  def record_not_found_redirect
    redirect_to new_short_path, alert: 'No short Url was found. Would you like to create a new one?'
  end

  # GET /shorts/1
  # GET /shorts/1.json
  def show
  end

  def point
    redirect_to @short.url
  end

  # GET /shorts/new
  def new
    @short = Short.new
  end

  # POST /shorts
  # POST /shorts.json
  def create
    @short = Short.new(short_params)

    respond_to do |format|
      if @short.save
        format.html { redirect_to @short, notice: 'Short was successfully created.' }
        format.json { render :show, status: :created, location: @short }
      else
        format.html { render :new }
        format.json { render json: @short.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short
      @short = Short.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_params
      params.require(:short).permit(:url)
    end
end
