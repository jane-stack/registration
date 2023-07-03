class StudentsController < ApplicationController
    before_action :find_student, only: [:show]
    skip_before_action :authorize, only: [:create]

    def index
        render json: Student.all
    end

    def show
        render json: @student, serializer: StudentWithCoursesSerializer
    end

    # POST /signup
    def create
        student = Student.new(student_params)
        if student.save
            session[:student_id] = student.id
            render json: student, status: 201
        else
            render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # GET /users
    def user
        render json: current_user
    end

    private
    def find_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.permit(:first_name, :last_name, :email, :password)
    end
end
