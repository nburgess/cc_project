class DistanceEssentialsController < ApplicationController
  # GET /distance_essentials
  # GET /distance_essentials.json
  def index
    @distance_essentials = DistanceEssential.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @distance_essentials }
    end
  end

  # GET /distance_essentials/1
  # GET /distance_essentials/1.json
  def show
    @distance_essential = DistanceEssential.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @distance_essential }
    end
  end

  # GET /distance_essentials/new
  # GET /distance_essentials/new.json
  def new
    @distance_essential = DistanceEssential.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @distance_essential }
    end
  end

  # GET /distance_essentials/1/edit
  def edit
    @distance_essential = DistanceEssential.find(params[:id])
  end

  # POST /distance_essentials
  # POST /distance_essentials.json
  def create
    @distance_essential = DistanceEssential.new(params[:distance_essential])

    respond_to do |format|
      if @distance_essential.save
        format.html { redirect_to @distance_essential, notice: 'Distance essential was successfully created.' }
        format.json { render json: @distance_essential, status: :created, location: @distance_essential }
      else
        format.html { render action: "new" }
        format.json { render json: @distance_essential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /distance_essentials/1
  # PUT /distance_essentials/1.json
  def update
    @distance_essential = DistanceEssential.find(params[:id])

    respond_to do |format|
      if @distance_essential.update_attributes(params[:distance_essential])
        format.html { redirect_to @distance_essential, notice: 'Distance essential was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @distance_essential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distance_essentials/1
  # DELETE /distance_essentials/1.json
  def destroy
    @distance_essential = DistanceEssential.find(params[:id])
    @distance_essential.destroy

    respond_to do |format|
      format.html { redirect_to distance_essentials_url }
      format.json { head :no_content }
    end
  end
end
