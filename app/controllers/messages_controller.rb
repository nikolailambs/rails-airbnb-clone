class MessagesController < ApplicationController

  before_action :set_message, only: [:show, :destroy]

  def index
    @messages = Message.all
    #@messages.users.build # user model

  end

  def show
  end

  def new
    @message = Message.new
    # @message.office_messages.build # user model
    # @message.receive_messages.build # office model
  end

  def create
    @message = Messages.new(message_params)

    if @message.save
      redirect_to message_path(@message)
    else
      render :new
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path # check for right path
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, office_messages_attributes: [:user_name], receive_messages_attributes: [:price, :user.user_name,])
  end

  def set_message
    @message = Message.find(params[:user_id] || params[:id] || params[:office_id])
  end

end
