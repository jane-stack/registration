class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authorize

    def logged_in?
        !!session[:student_id]
    end

    def current_user
        Student.find_by_id(session[:student_id])
    end

    def authorize
        render json: { errors: ["You must be logged in"] }, status: :unauthorized unless logged_in?
    end

    def authorize_user_resource(student_id)
        render json: { errors: ["You do not have permission for this resource"] }, status: :unauthorized unless student_id == current_user.id
    end
end
