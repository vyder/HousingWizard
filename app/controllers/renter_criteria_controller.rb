class RenterCriteriaController < ApplicationController
  # GET /renter_criteria
  # GET /renter_criteria.json
  def index
    @renter_criteria = RenterCriterium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @renter_criteria }
    end
  end

  # GET /renter_criteria/1
  # GET /renter_criteria/1.json
  def show
    @renter_criterium = RenterCriterium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @renter_criterium }
    end
  end

  # GET /renter_criteria/new
  # GET /renter_criteria/new.json
  def new
    @renter_criterium = RenterCriterium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @renter_criterium }
    end
  end

  # GET /renter_criteria/1/edit
  def edit
    @renter_criterium = RenterCriterium.find(params[:id])
  end

  # POST /renter_criteria
  # POST /renter_criteria.json
  def create
    @renter_criterium = RenterCriterium.new(params[:renter_criterium])

    respond_to do |format|
      if @renter_criterium.save
        format.html { redirect_to @renter_criterium, notice: 'Renter criterium was successfully created.' }
        format.json { render json: @renter_criterium, status: :created, location: @renter_criterium }
      else
        format.html { render action: "new" }
        format.json { render json: @renter_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /renter_criteria/1
  # PUT /renter_criteria/1.json
  def update
    @renter_criterium = RenterCriterium.find(params[:id])

    respond_to do |format|
      if @renter_criterium.update_attributes(params[:renter_criterium])
        format.html { redirect_to @renter_criterium, notice: 'Renter criterium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @renter_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /renter_criteria/1
  # DELETE /renter_criteria/1.json
  def destroy
    @renter_criterium = RenterCriterium.find(params[:id])
    @renter_criterium.destroy

    respond_to do |format|
      format.html { redirect_to renter_criteria_url }
      format.json { head :no_content }
    end
  end
end
