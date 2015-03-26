class Admin::AppointmentsController < ApplicationController
   before_filter :require_admin!

  def index
    @appointments = Condo.find(params[:condo_id]).appointments
  end

 
end
