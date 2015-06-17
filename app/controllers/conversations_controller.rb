class ConversationsController < ApplicationController
before_action :authenticate_user!

layout 'nofoot'
 
  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
    @listings = Listing.all
    @chosen_splisting = Listing.find_by(id: params[:splist].to_i) if params[:splist]
  end

def create

    recipients = User.where(id: conversation_params[:recipients])
    subject = Listing.where(id: conversation_params[:subject])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"
    redirect_to mailbox_inbox_path
  end
 
  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end
 
  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end
 
  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  def empty_trash
  mailbox.trash.each do |conversation|
    conversation.receipts_for(current_user).update_all(deleted: true)
  end
  flash[:success] = 'Your trash was cleaned!'
  redirect_to mailbox_inbox_path
  end

   def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end


  private
 
  def conversation_params
    params.require(:conversation).permit(:subject, :body, recipients:[])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end
end
