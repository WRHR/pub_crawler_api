class AuthenticationController < ApplicationController
    skip_before_action :authorized, only: [:login]
    def login 
        @user = User.find_by username: params[:user]['username']

        if !@user || !@user.authenticate(params[:user]['password'])
            render json: { errors: ['Wrong Username or Password'] }, status: :bad_request
        else
            payload = { user_id: @user.id }
            secret = Rails.application.secret_key_base
            @token = JWT.encode payload, secret 

            render json: { user: @user, token: @token }, status: :accepted
        end
    end
end
