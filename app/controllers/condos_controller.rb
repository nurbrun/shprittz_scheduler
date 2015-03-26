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

    if current_user.appointments.count
      @appointments_last_three = current_user.appointments.last(3).reverse
    end

  end
end
