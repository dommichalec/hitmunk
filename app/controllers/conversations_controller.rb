class ConversationsController < ApplicationController

  def index
    @conversations = current_user.mailbox.conversations
  end

  def inbox
    @conversations = current_user.mailbox.inbox
    render action: :index
  end

  def sent
    @conversations = current_user.mailbox.inbox
    render action: :index
  end

  def trash
    @conversations = current_user.mailbox.trash
    render action: :index
  end

  def new
    @recipients = User.all - [current_user]
  end

  def create
    receipt = User.find(params[:user_id])
    receipt = current_user.send_message(receipt, params[:body], params[:subject])
    calculate_points_for(current_user, 1)
    redirect_to conversation_path(receipt.conversation)
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.mark_as_read(current_user)
  end
end
