class SugestoesController < ApplicationController

  skip_before_filter :logado?, :only => :criar_sugestao

  def index
    @sugestoes = Sugestao.all
  end

  def criar_sugestao
    @sugestao = Sugestao.new(params[:sugestao])

    if @sugestao.save
      redirect_to sugestoes_path, :notice => 'Sugestao foi salva com sucesso'
    else
      render :action => "index", :error => 'Sugestao nao foi salva com sucesso'
    end
  end

end
