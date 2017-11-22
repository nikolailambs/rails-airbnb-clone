class MessagesController < ApplicationController
  def index
    @messages = Messages.all
  end

  def create
    @office = Office.find(params[:id])
    @message = Message.new(message_params)
    @message.user = current_user


    if @message.save
      redirect_to messages_path
    else
      render office_path(@office)
    end
  end

  def message_params
    params.require(:message).permit(:title, :content)
  end
end
