class SessionsController < ApplicationController

  skip_before_filter :logado?, :only => :login

  def login
    administrador = Administrador.authenticate(params[:login], params[:senha])
    if administrador
      session[:administrador_id] = administrador.id
      usuario_corrente
      redirect_to moteis_path
    else
      flash.now.alert = "Iduff ou senha invalidos"
      render 'pagina_login.html', :layout => false
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

end