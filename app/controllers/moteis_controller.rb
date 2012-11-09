class MoteisController < ApplicationController
  # GET /moteis
  # GET /moteis.json
  def index
    @moteis = Motel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moteis }
    end
  end

  # GET /moteis/1
  # GET /moteis/1.json
  def show
    @motel = Motel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @motel }
    end
  end

  # GET /moteis/new
  # GET /moteis/new.json
  def new
    @motel = Motel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @motel }
    end
  end

  # GET /moteis/1/edit
  def edit
    @motel = Motel.find(params[:id])
  end

  # POST /moteis
  # POST /moteis.json
  def create
    @motel = Motel.new(params[:motel])

    respond_to do |format|
      if @motel.save
        format.html { redirect_to @motel, notice: 'Motel was successfully created.' }
        format.json { render json: @motel, status: :created, location: @motel }
      else
        format.html { render action: "new" }
        format.json { render json: @motel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moteis/1
  # PUT /moteis/1.json
  def update
    @motel = Motel.find(params[:id])

    respond_to do |format|
      if @motel.update_attributes(params[:motel])
        format.html { redirect_to @motel, notice: 'Motel was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @motel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moteis/1
  # DELETE /moteis/1.json
  def destroy
    @motel = Motel.find(params[:id])
    @motel.destroy

    respond_to do |format|
      format.html { redirect_to moteis_url }
      format.json { head :ok }
    end
  end
end
