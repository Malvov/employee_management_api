module API
    module V1
        class ShiftsController < ApplicationController
            before_action :authenticate_user
            before_action :authorize_as_admin
            before_action :set_shift, only: [:show, :update, :destroy]
            
            def index
                @shifts = Shift.all
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
                    render json: @person, status: 200, location: api_v1_shifts_path(@shift)
                else
                    render json: @shift, status: :unprocessable_entity
                end
            end

            def destroy
                @shift.destroy
            end

            private

                def set_shift
                    @shift = Shift.find(params[:id])
                end

                def shift_params
                    params.require(:shift).permit(:date, :check_in, :check_out, :employee_id)
                end

        end
    end
end