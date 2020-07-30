class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def profile 
        render json: {user: current_user, crawls: current_user.crawls, favorites: current_user.favorites}
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            secret = Rails.application.secret_key_base
            @token = JWT.encode({ user_id: @user.id }, secret)
            render json: { user: @user, token: @token }, status: :created
        else
            render json: { errors: @user.errors.full_messages}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
