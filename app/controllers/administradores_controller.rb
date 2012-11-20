class AdministradoresController < ApplicationController

  def alterar_senha
    
  end

  def update
    @administrador = Administrador.find(params[:id])

    if @administrador.update_attributes(params[:administrador])
      flash[:notice] = 'Atualizado com sucesso.'
      redirect_to moteis_path
    else
      flash[:error] = 'Ocorreu um erro'
      render :action => "alterar_senha"
    end
  end

end
