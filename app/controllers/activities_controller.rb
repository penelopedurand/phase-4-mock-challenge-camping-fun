class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def show
        activity = find_activity
        render json: activity, status: :ok
    end

    def destroy
        activity = find_activity
            activity.destroy
            head :no_content
    end 

    private

    def find_activity
       Activity.find(params[:id])
    end

    def invalid(exception)
        render json: {error: exception.record.errors.full_messages}, status: :invalid
    end
end
