module API
    module V1
        class ShiftsController < ApplicationController
            before_action :authenticate_user
            before_action :authorize_as_admin, except: [:index]
            before_action :set_shift, only: [:show, :update, :destroy]
            
            def index
                if current_user.is_admin?
                    @shifts = Shift.all
                else
                    @shifts = current_user.employee.shifts
                end
                render json: @shifts
            end
            
            def show
                render json: @shift
            end

            def create
                @shift = Shift.new(shift_params)
                if @shift.save
                    render json: @shift, status: :created, location: api_v1_shifts_path(@shift)
                else
                    render json: @shift.errors, status: :unprocessable_entity
                end
            end

            def update
                if @shift.update(shift_params)
                    render json: @shift, status: :created, location: api_v1_shifts_path(@shift)
                else
                    render json: @shift, status: :unprocessable_entity
                end
            end

            def destroy
                if @shift.destroy
                    render json: { status: 'ok' }
                else
                    render json: { status: :unprocessable_entity }
                end
            end

            private

                def set_shift
                    @shift = Shift.find(params[:id])
                end

                def shift_params
                    params.require(:shift).permit(:date, :check_in, :check_out, :employee_id, :comment)
                end

        end
    end
end