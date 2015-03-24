class AppointmentsController < ApplicationController
  before_filter :load_condo

  def create
    @appointment = @condo.appointments.build(appointment_params)
  
      if @appointment.save
        redirect_to condo_path(@condo.address), notice: 'Appointment booked successfully'
      else
        render 'condo/#{<%= condo.id %>}'
      end
  end
  private

  def load_condo
      @condo = Condo.find_by_address(params[:condo_id])
  end

  def appointment_params
    params.require(:appointment).permit(:condo_id, :user_id, :date, :wash_type, :inside_only, :inside_and_outside, :outside_only)
  end
end
