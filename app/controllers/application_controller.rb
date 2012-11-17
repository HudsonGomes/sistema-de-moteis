class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :administrador_corrente
  before_filter :logado?, :except => :pagina_login

  def logado?
    if not session[:administrador_id]
      redirect_to(pagina_login_path, :alert => "Usuario invalido")
    else
      usuario_corrente
    end
  end

  def usuario_corrente
    @administrador_corrente ||= Administrador.find(session[:administrador_id])
  end

  def pagina_login
    render :layout => false
  end	

end
