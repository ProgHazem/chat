class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @message = Message.new
    @messages = Message.custem_message
  end
end
