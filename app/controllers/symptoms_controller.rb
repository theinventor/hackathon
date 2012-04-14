class SymptomsController < ApplicationController
  # GET /symptoms
  # GET /symptoms.json
  def index
    @symptoms = Symptom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @symptoms }
    end
  end

  # GET /symptoms/1
  # GET /symptoms/1.json
  def show
    @symptom = Symptom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @symptom }
    end
  end

  # GET /symptoms/new
  # GET /symptoms/new.json
  def new
    @symptom = Symptom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @symptom }
    end
  end

  # GET /symptoms/1/edit
  def edit
    @symptom = Symptom.find(params[:id])
  end

  # POST /symptoms
  # POST /symptoms.json
  def create
    @symptom = Symptom.new(params[:symptom])

    respond_to do |format|
      if @symptom.save
        format.html { redirect_to @symptom, notice: 'Symptom was successfully created.' }
        format.json { render json: @symptom, status: :created, location: @symptom }
      else
        format.html { render action: "new" }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /symptoms/1
  # PUT /symptoms/1.json
  def update
    @symptom = Symptom.find(params[:id])

    respond_to do |format|
      if @symptom.update_attributes(params[:symptom])
        format.html { redirect_to @symptom, notice: 'Symptom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symptoms/1
  # DELETE /symptoms/1.json
  def destroy
    @symptom = Symptom.find(params[:id])
    @symptom.destroy

    respond_to do |format|
      format.html { redirect_to symptoms_url }
      format.json { head :no_content }
    end
  end
end
