class UsersController < ApplicationController

  # Le whitelistage du paramètre :bar_id est fait dans ApplicationController

  skip_before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

end
