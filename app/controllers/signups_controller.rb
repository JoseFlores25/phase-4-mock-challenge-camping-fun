class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
    signups = Signup.all
    render json: signups
    end


    def create
        signup = Signup.create!(signup_params)
        render json: signup, include: ["activity"], status: :created
    end

    private

    # def find_signup
    #     Signup.find_by(id: params[:id])
    # end

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end


 def render_unprocessable_entity(exception)
        render json: {errors:  [exception.record.errors]}, status: :unprocessable_entity
    end
end
