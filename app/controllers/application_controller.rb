class ApplicationController < ActionController::API
    def current_user     
        return nil if !auth_token || !decoded_payload
        User.find_by(id: decoded_payload[0]["user_id"])
    end

    def verify_authenticated
        if !current_user
            render json: { message: "You aren't authenticated." }, status: 401
        end
    end

    def is_adm_authenticated?

        if !current_user.adm?
            render json: { message: "no admin permission." }, status: 403
        end
    end

    def is_adm_authenticated_or_is_my_message
        @message = Message.find(params[:id])

        unless @message and (current_user.adm? or current_user.id == @message.user_id)
            render json: { message: "Without permission" }, status: 403
        end
    end

    def headers
        request.headers
    end

    def auth_token
        headers["Auth-Token"]
    end

    def decoded_payload
        JsonWebToken::Base.decode(auth_token)
    end
end