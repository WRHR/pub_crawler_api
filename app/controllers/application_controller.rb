class ApplicationController < ActionController::API
    def authenticate
        header = request.headers["Authorization"]
        token = header.split(' ')[1]

        if !token
            render json: { error: "You must be logged in to do this"}, status: :unauthorized
        else
            secret = Rails.application.secret_key_base
            begin
                payload = JWT.decode(token, secret)[0]
                @user = User.find(params[:id])
            rescue
                render json: { error: "You must be logged in to do this"}, status: :unauthorized
            end
        end
    end
end
