class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    # POST /login
    def create
        student = Student.find_by_email(params[:email])
        if student&.authenticate(params[:password])
            session[:student_id] = student.id
            render json: student
        else
            render json: { errors: ["Username or Password didn't match"] }, status: :unprocessable_entity
        end
    end

    # DELETE /logout
    def destroy
        session.delete :student_id
        render json: { message: "You've Logged Out" }
    end
end
