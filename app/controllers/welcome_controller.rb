class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!
  skip_before_action :authenticate_admin!

  def index
  end

  def papshere
    @user = current_user
    @jour = Jour.actif
  end

end
