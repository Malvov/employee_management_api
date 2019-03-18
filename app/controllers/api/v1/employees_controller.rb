module API
    module V1
        class EmployeesController < ApplicationController
            before_action :authenticate_user
            before_action :authorize, only: [:show]

            def index
                if current_user.is_admin?
                    @employees = Employee.all
                    render json: @employees
                else
                    render status: :forbidden
                end
            end

            def show
                @employee = Employee.find(params[:id])
                render json: @employee
            end

            private

            def authorize
                render status: :forbidden unless current_user && current_user.can_see_info?(params[:id])
            end
        end
    end
end
