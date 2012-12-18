class SuitesController < ApplicationController

  def show
    @suite = Suite.find(params[:id])
  end
  
  def cadastrar_suite
    attributes = {:nome => params[:nome], :valor => params[:valor],
      :descricao => params[:descricao], :motel_id => params[:idmotel]}
    
    @suite = Suite.new attributes

    if @suite.save
      flash[:notice] = 'Suite foi salva com sucesso'
      redirect_to motel_path(@suite.motel_id)
    else
      flash[:error] = 'Um erro ocorreu'
    end
  end

  def edit
    @suite = Suite.find(params[:id])
  end

  def update
    @suite = Suite.find(params[:id])

    respond_to do |format|
      if @suite.update_attributes(params[:suite])
        format.html { redirect_to @suite, :notice => 'Suite foi atualizada com sucesso' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @suite = Suite.find(params[:id])
    @suite.destroy

    respond_to do |format|
      format.html { redirect_to suites_url }
    end
  end
end
