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
                    render json: { status: 403, msg: "You're not authorized to see this page" }
                end
            end

            def show
                @employee = current_user.employee
                render json: @employee
            end

            private

            def authorize
                return_unauthorized unless current_user && current_user.can_see_info?(params[:id])
            end
        end
    end
end
