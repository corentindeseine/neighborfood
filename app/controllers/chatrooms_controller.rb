class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @chatrooms = current_user.chatrooms
    render 'index'
  end

  def show
    @chatrooms = Chatroom.all
    @chatroom  = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages.order(created_at: :asc)

    @users = User.where.not(id: current_user.id)
    respond_to do |format|

      format.json do
        render json: {
          html: render_to_string(partial: 'chatrooms/chatroom', locals: { chatroom: @chatroom, message: @message }, layout: false, formats: [:html])
        }
      end
      format.html
    end
  end

  def create
    @chatroom = Chatroom.create(name: params['chatroom']['name'])
  end
end
