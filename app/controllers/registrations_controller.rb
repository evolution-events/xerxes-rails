class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      redirect_to @registration, notice: 'Registration was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /registrations/1
  def update
    if @registration.update(registration_params)
      redirect_to @registration, notice: 'Registration was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /registrations/1
  def destroy
    @registration.destroy

    redirect_to registrations_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:user_id, :event_id, :status)
    end
end
