class SuitesController < ApplicationController

  def index
    @suites = Suite.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @suite = Suite.find(params[:id])
  end
  
  def new
    @suite = Suite.new
  end

  def edit
    @suite = Suite.find(params[:id])
  end

  def create
    @suite = Suite.new(params[:suite])

    respond_to do |format|
      if @suite.save
        format.html { redirect_to @suite, :notice => 'Suite foi salva com sucesso' }
      else
        format.html { render :action => "new" }
      end
    end
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
