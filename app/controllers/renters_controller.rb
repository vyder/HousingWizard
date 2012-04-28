class RentersController < ApplicationController
  # GET /renters
  # GET /renters.json
  def index
    @renters = Renter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @renters }
    end
  end

  # GET /renters/1
  # GET /renters/1.json
  def show
    @renter = Renter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @renter }
    end
  end

  # GET /renters/new
  # GET /renters/new.json
  def new
    @renter = Renter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @renter }
    end
  end

  # GET /renters/1/edit
  def edit
    @renter = Renter.find(params[:id])
  end

  # POST /renters
  # POST /renters.json
  def create
    @renter = Renter.new(params[:renter])

    respond_to do |format|
      if @renter.save
        format.html { redirect_to @renter, notice: 'Renter was successfully created.' }
        format.json { render json: @renter, status: :created, location: @renter }
      else
        format.html { render action: "new" }
        format.json { render json: @renter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /renters/1
  # PUT /renters/1.json
  def update
    @renter = Renter.find(params[:id])

    respond_to do |format|
      if @renter.update_attributes(params[:renter])
        format.html { redirect_to @renter, notice: 'Renter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @renter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /renters/1
  # DELETE /renters/1.json
  def destroy
    @renter = Renter.find(params[:id])
    @renter.destroy

    respond_to do |format|
      format.html { redirect_to renters_url }
      format.json { head :no_content }
    end
  end
end
