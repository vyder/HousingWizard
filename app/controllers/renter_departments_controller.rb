class RenterDepartmentsController < ApplicationController
  # GET /renter_departments
  # GET /renter_departments.json
  def index
    @renter_departments = RenterDepartment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @renter_departments }
    end
  end

  # GET /renter_departments/1
  # GET /renter_departments/1.json
  def show
    @renter_department = RenterDepartment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @renter_department }
    end
  end

  # GET /renter_departments/new
  # GET /renter_departments/new.json
  def new
    @renter_department = RenterDepartment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @renter_department }
    end
  end

  # GET /renter_departments/1/edit
  def edit
    @renter_department = RenterDepartment.find(params[:id])
  end

  # POST /renter_departments
  # POST /renter_departments.json
  def create
    @renter_department = RenterDepartment.new(params[:renter_department])

    respond_to do |format|
      if @renter_department.save
        format.html { redirect_to @renter_department, notice: 'Renter department was successfully created.' }
        format.json { render json: @renter_department, status: :created, location: @renter_department }
      else
        format.html { render action: "new" }
        format.json { render json: @renter_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /renter_departments/1
  # PUT /renter_departments/1.json
  def update
    @renter_department = RenterDepartment.find(params[:id])

    respond_to do |format|
      if @renter_department.update_attributes(params[:renter_department])
        format.html { redirect_to @renter_department, notice: 'Renter department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @renter_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /renter_departments/1
  # DELETE /renter_departments/1.json
  def destroy
    @renter_department = RenterDepartment.find(params[:id])
    @renter_department.destroy

    respond_to do |format|
      format.html { redirect_to renter_departments_url }
      format.json { head :no_content }
    end
  end
end
