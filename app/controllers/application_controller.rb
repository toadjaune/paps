class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Ajout du paramètre 'Bar' pour la création des utilisateurs ... C'est dégeulasse de le mettre ici.
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :bar_id
    end

end
