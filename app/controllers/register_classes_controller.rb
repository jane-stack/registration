class RegisterClassesController < ApplicationController
    before_action :find_registraion, only: [:destroy]

    def create
        register = RegisterClass.create(registration_params)
        if register.valid?
            render json: register.course, status: 201
        else
            render json: { errors: register.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @register.destroy
        render json: { message: "Registration destroyed" }
    end

    private
    def registration_params
        params.permit(:student_id, :course_id)
    end

    def find_registraion
        @register = RegisterClass.find(params[:course_id])
    end
end
