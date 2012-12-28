class Ws::WsController < ApplicationController

  skip_before_filter :logado?

  def listagem_moteis_proximos

    key = "4g25lhio3b6j3v5615125oinlk"
    begin
      if params.fetch(:key) == key

        latitude = params.fetch(:latitude)
        longitude = params.fetch(:longitude)

        @moteis = Motel.ativos.mais_proximos(latitude, longitude)

        if @moteis.any?
          dados = Motel.dados_xml(@moteis)
          render :xml => dados, :root => 'moteis'
        else
          render :text => "Nenhum motel encontrado"
        end
      else
        render :nothing => true, :status => :unauthorized
      end
    rescue IndexError
      render :nothing => true, :status => 400
    end

  end

  def listagem_moteis_regiao
    
    key = "4736473gio321sgdo015136tnsg"
    begin
      if params.fetch(:key) == key

        regiao = Localizacao.identifica_localizacao(params.fetch(:regiao))
        @moteis = Motel.ativos.por_regiao(regiao)

        if @moteis.any?
          dados = Motel.dados_xml(@moteis)
          render :xml => dados, :root => 'moteis'
        else
          render :text => "Nenhum motel encontrado"
        end
      else
        render :nothing => true, :status => :unauthorized
      end
    rescue IndexError
      render :nothing => true, :status => 400
    end
  end

  def criar_sugestao

    key = "4g25l879vd8fbgwbg04889nhcd"
    begin
      if params.fetch(:key) == key
        
        params.delete_if { |chave| !['nome', 'email', 'mensagem'].include? chave.to_s }

        @sugestao = Sugestao.new(params)

        if @sugestao.save
          render :text => "Sugestao criada com sucesso"
        else
          render :text => "Ocorreu um erro ao criar sugestao"
        end
      else
        render :nothing => true, :status => :unauthorized
      end
    rescue IndexError
      render :nothing => true, :status => 400
    end
  end
end
