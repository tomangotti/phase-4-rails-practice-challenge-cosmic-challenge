class MissionsController < ApplicationController
    

    def create
        mission = Mission.new(mission_params)
        mission.save
        planet1 = mission.planet
        render json: planet1, status: :created
        
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end

    
end

