class CondosController < ApplicationController
  def new
    @condo = Condo.new
    @condo.user = User.new
  end
end
