class CondosController < ApplicationController
  def new
    @condo = Condo.new
    @condo.user = User.new
  end

  def show
    @condo = Condo.find_by_address(params[:id])
  end
end
