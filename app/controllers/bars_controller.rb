class BarsController < ApplicationController
  
  def new
  end

  def create
    render plain: params[:bar].inspect
  end

end
