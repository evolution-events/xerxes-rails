class RegisterController < ApplicationController
  before_action :set_event

  def start
  end
  def register
    registration = Registration.new
    registration.event = @event
    registration.user = @current_user
    registration.status = :reserved
    respond_to do |format|
      if registration.save
        # TODO: If details are incomplete, redirect to details changing
        # page directly
        format.html { redirect_to action: :check_details }
      else
        format.html { redirect_to action: :register }
      end
    end
  end
  def check_details
    #TODO: Need to pass the created registration in register to here?
    #How? It also needs to be passed onwards through the rest of the
    #process
  end
  def details_checked
    if params.has_key?(:details_ok)
      redirect_to action: :complete
    else
      # TODO: Allow changing details
      redirect_to action: :complete
    end
  end
  def complete
    #TODO: Change status of registration
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
end
