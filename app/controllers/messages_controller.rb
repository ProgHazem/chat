class MessagesController < ApplicationController
  before_action :set_params, except: [:create]
  before_action :require_user
  def create
    @message = current_user.messages.build(set_params)
    if @message.save
      redirect_to root_path
    else
      flash.now[:error] = "Error to put message try again"
      render root_path
    end
  end

  private
    def set_params
      params.require(:message).permit(:body)
    end
end
