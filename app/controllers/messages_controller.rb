class MessagesController < ApplicationController
    before_action :verify_authenticated
    before_action :is_adm_authenticated?, only: [:show]
    before_action :message_params, only: [:create, :update] 
    before_action :is_adm_authenticated_or_is_my_message, only: [:update, :delete]
    before_action :set_message, only: [:show, :update, :delete]
    def index
        @messages = Message.all

        render json: @messages, status: :ok
    end

    def show
        if @message
            render json: @message, status: :ok
        else
            render json: @message.errors, status: :not_found
        end
    end

    def create
        @message_params[:user_id] = current_user.id
        @message = Message.new(@message_params)
        if @message.save
            render json: @message, status: :created
        else
            render json: @message.errors, status: 422
        end
    end

    def update
        if @message.update(@message_params)
            render json: @message, status: :ok
        else   
            render json: @message.errors, status: :not_found
        end
    end

    def delete
        if @message.destroy
            render json: {message: "Message deleted!" }, status: :ok
        else
            render json: @message.errors, status: :not_found
        end
    end

    private
    def message_params
        @message_params = params.require(:message).permit(:content)
    end

    def set_message 
        @message = Message.find(params[:id])
    end
end