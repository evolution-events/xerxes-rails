class SeriesController < ApplicationController
  before_action :set_series, only: [:show, :edit, :update, :destroy]

  # GET /series
  def index
    @series = Series.all
  end

  # GET /series/1
  def show
  end

  # GET /series/new
  def new
    @series = Series.new
  end

  # GET /series/1/edit
  def edit
  end

  # POST /series
  def create
    @series = Series.new(series_params)

    if @series.save
      redirect_to @series, notice: 'Series was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /series/1
  def update
    if @series.update(series_params)
      redirect_to @series, notice: 'Series was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /series/1
  def destroy
    @series.destroy

    redirect_to series_index_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:name, :url, :email)
    end
end
