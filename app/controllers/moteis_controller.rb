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

  def create
   @motel = Motel.new(params[:motel])
   if @motel.save
      flash[:notice] = 'Motel criado com sucesso'
      redirect_to moteis_path
   else
     flash[:error] = 'Nao foi possivel criar motel'
     render 'new'
   end
  end

  def edit
    @motel = Motel.find(params[:id])
  end

  def update
    @motel = Motel.find(params[:id])
    if @motel.update_attributes(params[:motel])
	redirect_to moteis_path
    else
	flash[:error] = 'Nao foi possivel editar motel'
	render 'edit'
    end
  end

  def destroy
   
  end

end
