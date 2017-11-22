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

  def show
    @messages = Message.where(user_id: current_user.id).order(created_at: :desc)

    if params[:office_id]
      @messages = @messages.where(office_id: params[:office_id])
      render 'index'
    end
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


