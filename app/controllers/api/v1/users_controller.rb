class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:show, :update]
    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: @user
        else
            render json: {message: @user.errors.full_messages}
        end
    end

    def update
        @user.update(user_params)
        render json: @user
    end

    private
    
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :username, :password, :description)
    end
end
