class MoteisController < ApplicationController

  def index
    @moteis_ativos = Motel.ativos

    @moteis_inativos = Motel.inativos
  end

  def show
    @motel = Motel.find(params[:id])

    @suites = Suite.find_all_by_motel_id(params[:id])
  end

  def new
    @motel = Motel.new
  end

  def edit
    @motel = Motel.find(params[:id])
  end

  def create
    @motel = Motel.new(params[:motel])
    @motel.ativo = Motel::ATIVO

    respond_to do |format|
      if @motel.save
        format.html { redirect_to @motel, :notice => 'Motel foi salvo com sucesso' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @motel = Motel.find(params[:id])

    respond_to do |format|
      if @motel.update_attributes(params[:motel])
        format.html { redirect_to @motel, :notice => 'Motel foi atualizado com sucesso.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def desativar
    @motel = Motel.find(params[:id])
    @motel.ativo = Motel::INATIVO
    @motel.save

    redirect_to moteis_url
  end

  def ativar
    @motel = Motel.find(params[:id])
    @motel.ativo = Motel::ATIVO
    @motel.save

    redirect_to moteis_url
  end
  
end
