class Admin::CondosController < ApplicationController
   before_filter :require_admin!

  def index
    @condos = Condo.all
  end

  def show
    @condo = Condo.find(params[:id])
  end

end
