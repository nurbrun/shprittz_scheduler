class CondosController < ApplicationController
  def new
    @condo = Condo.new
    @condo.user = User.new
  end

  def show
    @condo = Condo.find_by_address(params[:id])
    if current_user
      # @appointment = Appointment.new
      @appointment = @condo.appointments.build
    else
    end

  end
end
