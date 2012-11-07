class ApplicationController < ActionController::Base
  protect_from_forgery

  def pagina_login
    render :layout => false
  end	

  def pagina_inicial

  end

end
