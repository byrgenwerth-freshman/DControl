class SwitchModulesController < ApplicationController
  # GET /switch_modules
  # GET /switch_modules.json
  def index
    @switch_modules = SwitchModule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @switch_modules }
    end
  end

  # GET /switch_modules/1
  # GET /switch_modules/1.json
  def show
    @switch_module = SwitchModule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @switch_module }
    end
  end

  # GET /switch_modules/new
  # GET /switch_modules/new.json
  def new
    @switch_module = SwitchModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @switch_module }
    end
  end

  # GET /switch_modules/1/edit
  def edit
    @switch_module = SwitchModule.find(params[:id])
  end

  # POST /switch_modules
  # POST /switch_modules.json
  def create
    @switch_module = SwitchModule.new(params[:switch_module])

    respond_to do |format|
      if @switch_module.save
        format.html { redirect_to @switch_module, notice: 'Switch module was successfully created.' }
        format.json { render json: @switch_module, status: :created, location: @switch_module }
      else
        format.html { render action: "new" }
        format.json { render json: @switch_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /switch_modules/1
  # PUT /switch_modules/1.json
  def update
    @switch_module = SwitchModule.find(params[:id])

    respond_to do |format|
      if @switch_module.update_attributes(params[:switch_module])
        format.html { redirect_to @switch_module, notice: 'Switch module was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @switch_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /switch_modules/1
  # DELETE /switch_modules/1.json
  def destroy
    @switch_module = SwitchModule.find(params[:id])
    @switch_module.destroy

    respond_to do |format|
      format.html { redirect_to switch_modules_url }
      format.json { head :no_content }
    end
  end
end
