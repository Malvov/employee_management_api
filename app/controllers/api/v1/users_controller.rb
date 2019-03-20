module API
    module V1
        class UsersController < ApplicationController
            # Use Knock to make sure the current_user is authenticated before completing request.
            before_action :authenticate_user
            before_action :authorize_as_admin, only: [:create, :destroy, :update]
            before_action :set_user, only: [:update, :destroy]
            
            # Should work if the current_user is authenticated.
            def index
                @users = User.all
                render json: @users
            end

            def show
                if params[:id] == 'login'
                    @user = current_user
                else
                    @user = User.find(params[:id]) 
                end
                render json: @user
            end

            # Method to create a new user using the safe params we setup.
            def create
                @user = User.new(user_params)
                if @user.save
                    render json: @user
                else
                    render json: { errors: @user.errors, status: 400, msg: 'Something went wrong' }
                end
            end
            
            # Method to update a specific user. User will need to be authorized.
            def update
                if @user.update(user_params)
                 render json: @user
                else
                    render json: { status: 400, msg: 'Something went wrong' }
                end
            end
            
            # Method to delete a user, this method is only for admin accounts.
            def destroy
                if @user.destroy
                    render json: { status: 200, msg: 'User has been deleted.' }
                else
                    render json: { status: 400, msg: 'Something went wrong' }
                end
            end
          
            private
            
            # Setting up strict parameters for when we add account creation.
            def user_params
                params.require(:user).permit(:username, :email, :password, :password_confirmation,
                    :role,
                    employee_attributes: [:id, :first_name, :last_name, :entry_date, :active])
            end

            def set_user
                @user = User.find(params[:id])
            end
            
        end
    end
end