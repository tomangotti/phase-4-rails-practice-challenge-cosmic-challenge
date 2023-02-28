class ScientistsController < ApplicationController
 
  before_action :set_scientist, only: %i[ show update destroy ]

  # GET /scientists
  def index
    @scientists = Scientist.all
    render json: @scientists
  end

  # GET /scientists/1
  def show
    render json: @scientist, serializer: ScientistWithPlanetsSerializer
  end

  # POST /scientists
  def create
    @scientist = Scientist.new(scientist_params)
    @scientist.save
      render json: @scientist, status: :created
    
  end

  # PATCH/PUT /scientists/1
  def update
    @scientist.update(scientist_params)
    render json: @scientist, status: :accepted
    
  end

  # DELETE /scientists/1
  def destroy
    @scientist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scientist
      @scientist = Scientist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scientist_params
      params.permit(:name, :field_of_study, :avatar)
    end

    
end
