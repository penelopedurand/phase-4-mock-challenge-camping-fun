class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = find_camper
        render json: camper, Serializer: :CamperactivitiesSerializer, status: :ok
    end

    def create
        camper = Camper.create!(campers_params)
        render json: camper, status: :created
    end

    def update
        camper = Camper.update(find_camper)
        render json: camper, status: 200
    end 

    # def destroy
    #     camper = find_camper
    #     camper.destroy
    #     head :no_content
    # end 

    private
    def campers_params
        params.permit(:name, :age)
    end

    def find_camper
       Camper.find(params[:id])
    end

    def invalid(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
