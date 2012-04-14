class MealsController < ApplicationController
  # GET /meals
  # GET /meals.json
  def index
    @meals = current_user.meals

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @meal = current_user.meals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/new
  # GET /meals/new.json
  def new
    @meal = current_user.meals.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/1/edit
  def edit
    @meal = current_user.meals.find(params[:id])
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = current_user.meals.build(params[:meal])

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
        format.json { render json: @meal, status: :created, location: @meal }
      else
        format.html { render action: "new" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meals/1
  # PUT /meals/1.json
  def update
    @meal = current_user.meals.find(params[:id])

    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal = current_user.meals.find(params[:id])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :no_content }
    end
  end
end
