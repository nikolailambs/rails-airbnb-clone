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

  end

  def create

    @message = Message.new(message_params)
    @message.offices.build # user model
    @message.users.build # office model

    if @message.save
      redirect_to messages_path
    else
      redirect_to office_path(@message.office)
    end
  end

  def message_params
    params.require(:message).permit(:title, :content)

  end

  def destroy
    @message.destroy
    redirect_to messages_path # check for right path
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :user_id, :office_id)
  end

  def set_message
    @message = Message.find(params[:user_id] || params[:id] || params[:office_id])
  end

end
