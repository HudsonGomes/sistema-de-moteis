class SugestoesController < ApplicationController

  def index
    @sugestoes = Sugestao.all
  end

  def destroy
    @sugestao = Sugestao.find(params[:id])
    @sugestao.destroy

    redirect_to sugestoes_path
  end
end
