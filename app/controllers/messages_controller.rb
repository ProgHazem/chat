class MessagesController < ApplicationController
  before_action :set_params, except: [:create]
  before_action :require_user
  def create
    @message = current_user.messages.build(set_params)
    if @message.save
      ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(@message)
      # redirect_to root_path
    else
      flash.now[:error] = "Error to put message try again"
      render root_path
    end
  end

  private
    def set_params
      params.require(:message).permit(:body)
    end
  def message_render(message)
    render(partials: 'messages/message', locals: {message: message})
  end
end
