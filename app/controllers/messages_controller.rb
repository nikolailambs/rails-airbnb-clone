class MessagesController < ApplicationController
  def index
    @messages = Messages.all
  end

  def show
    @messages = Message.where(user_id: current_user.id).order(created_at: :desc)

    if params[:office_id]
      @messages = @messages.where(office_id: params[:office_id])
      render 'index'
    end
  end

  def create
    @messages = Message.new
  end
end


