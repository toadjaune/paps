class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Ajout du paramètre 'Bar' pour la création des utilisateurs ... C'est dégeulasse de le mettre ici.
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Pour être sécu, par défaut il faut être admin partout
  before_action :authenticate_admin!
  before_action :authenticate_user!

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :bar_id
    end

    def authenticate_admin!
      unless user_signed_in? and current_user.admin?
        flash.alert = "Vous devez être administrateur pour accéder à cette page"
        redirect_to '/'
      end
    end
  
end
