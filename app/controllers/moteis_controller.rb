class MoteisController < ApplicationController

  skip_before_filter :logado?, :only => :listagem_xml

  def index
    @moteis_ativos = Motel.ativos

    @moteis_inativos = Motel.inativos
  end

  def listagem_xml
    @moteis = Motel.ativos

    respond_to do |format|
      format.xml { render :xml => @moteis, :only => [:nome, :cep, :endereco,
          :endnumero, :bairro, :telefone1, :cidade, :uf, :latitude, :longitude] }
    end
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
    @motel.ativo = 1

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
    @motel.ativo = 0
    @motel.save

    redirect_to moteis_url
  end

  def ativar
    @motel = Motel.find(params[:id])
    @motel.ativo = 1
    @motel.save

    redirect_to moteis_url
  end
end
