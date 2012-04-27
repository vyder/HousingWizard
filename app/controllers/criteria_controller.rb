class CriteriaController < ApplicationController
  # GET /criteria
  # GET /criteria.json
  def index
    @criteria = Criterium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @criteria }
    end
  end

  # GET /criteria/1
  # GET /criteria/1.json
  def show
    @criterium = Criterium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @criterium }
    end
  end

  # GET /criteria/new
  # GET /criteria/new.json
  def new
    @criterium = Criterium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @criterium }
    end
  end

  # GET /criteria/1/edit
  def edit
    @criterium = Criterium.find(params[:id])
  end

  # POST /criteria
  # POST /criteria.json
  def create
    @criterium = Criterium.new(params[:criterium])

    respond_to do |format|
      if @criterium.save
        format.html { redirect_to @criterium, notice: 'Criterium was successfully created.' }
        format.json { render json: @criterium, status: :created, location: @criterium }
      else
        format.html { render action: "new" }
        format.json { render json: @criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /criteria/1
  # PUT /criteria/1.json
  def update
    @criterium = Criterium.find(params[:id])

    respond_to do |format|
      if @criterium.update_attributes(params[:criterium])
        format.html { redirect_to @criterium, notice: 'Criterium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criteria/1
  # DELETE /criteria/1.json
  def destroy
    @criterium = Criterium.find(params[:id])
    @criterium.destroy

    respond_to do |format|
      format.html { redirect_to criteria_url }
      format.json { head :no_content }
    end
  end
end
