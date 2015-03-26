class AppointmentsController < ApplicationController
  before_filter :load_condo

  def index
    if current_user.appointments.count
      @appointments = current_user.appointments.all
    else
      render 'go home'
    end
  end


  def create
    @appointment = @condo.appointments.build(appointment_params)
  
      if @appointment.save
        redirect_to condo_path(@condo.address), notice: 'Appointment booked successfully'
      else
        render 'condo/#{<%= condo.id %>}'
      end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes(:date => params[:date])

    if @appointment.update_attributes(appointment_params)
      flash[:success] = "Appointment updated"
      render 'edit'
    else
      render 'edit'
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
