class Ws::MoteisController < ApplicationController

  skip_before_filter :logado?

  def listagem_moteis
    if params[:cidade]
      @moteis = Motel.por_cidade(params[:cidade])
    elsif params[:latitude] && params[:longitude]
      lat_mais = (params[:latitude].to_f + 0.03)
      lat_menos = (params[:latitude].to_f - 0.03)
      long_mais = (params[:longitude].to_f + 0.1)
      long_menos = (params[:longitude].to_f - 0.1)
      @moteis = Motel.ativos.mais_proximos(lat_mais, lat_menos, long_mais, long_menos)
    else
      @moteis = Motel.ativos
    end

    respond_to do |format|
      format.xml { render :xml => @moteis, :only => [:nome, :cep, :endereco,
          :endnumero, :bairro, :telefone1, :cidade, :uf, :latitude, :longitude] }
    end

  end

  def criar_sugestao
    respond_to do |format|
      if params[:nome] && params[:email] && params[:mensagem]

        hash_params = {:sugestao => {:nome => params[:nome], :email => params[:email], :mensagem => params[:mensagem]}}

        @sugestao = Sugestao.new(hash_params[:sugestao])

        if @sugestao.save
          format.xml { render :xml => {:message => "Sugestao enviada com sucesso" }.to_xml(:skip_types => true, :root => :sugestao)}

          format.json { render :json => {:erro => {:message => "Sugestao enviada com sucesso" }}}
        else
          format.xml { render :xml => {:message => "Houve algum problema ao criar sugestao" }.to_xml(:skip_types => true, :root => :sugestao)}

          format.json { render :json => {:erro => {:message => "Houve algum problema ao criar sugestao" }}}
        end
      else
        format.xml { render :xml => {:message => "Parametros enviados de forma incorreta" }.to_xml(:skip_types => true, :root => :erro)}

        format.json { render :json => {:erro => {:message => "Parametros enviados de forma incorreta" }}}
      end
    end
  end
  
end
