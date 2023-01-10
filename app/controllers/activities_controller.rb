class ActivitiesController < ApplicationController
  def index

    activities = Activity.all
    render json: activities
end

def destroy
 activity = Activity.find_by(id: params[:id])
 if activity
 activity.destroy!
 head :no_content
 else
render json: { error: "Activity not found" }, status: :not_found
end
end

def create
    activity = Activity.create!(activity_params)
    render json: activity, status: :created
  end

private

  def activity_params
    params.permit(:name, :difficulty)
end
end
