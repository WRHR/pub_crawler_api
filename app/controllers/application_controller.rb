class ApplicationController < ActionController::API
    before_action :authorized

    def current_user
       auth_header = request.headers['Authorization']
       if auth_header
            token = auth_header.split(' ')[1]
            begin
                secret = Rails.application.secret_key_base
                @user_id = JWT.decode(token, secret)[0]["user_id"]
            rescue JWT::DecodeError
                nil
            end
            @user = User.find(@user_id)
       end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: 'Please Log In'}, status: :unauthorized unless logged_in?
    end


end
