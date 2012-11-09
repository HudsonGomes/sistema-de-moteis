class MoteisController < ApplicationController

  def index
    @moteis = Motel.all
  end

  def show
    @motel = Motel.find(params[:id])
  end

  def new
    @motel = Motel.new
  end

  def edit
    @motel = Motel.find(params[:id])
  end

  def create
    @motel = Motel.new(params[:motel])

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
        format.html { redirect_to @motel, :notice => 'Motel was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @motel = Motel.find(params[:id])
    @motel.destroy

    respond_to do |format|
      format.html { redirect_to moteis_url }
    end
  end
end
