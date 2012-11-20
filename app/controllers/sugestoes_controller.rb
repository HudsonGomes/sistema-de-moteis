class SugestoesController < ApplicationController

  def index
    @sugestoes = Sugestao.all
  end

  def create
    @sugestao = Sugestao.new(params[:sugestao])

    if @sugestao.save
      redirect_to @sugestao, :notice => 'Sugestao foi salva com sucesso'
    else
      render :action => "index", :error => 'Sugestao nao foi salva com sucesso'
    end
  end

end
