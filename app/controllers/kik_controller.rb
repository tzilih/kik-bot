
class KikController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def new
  end
  def webhook
    messages = kik_event_params[:messages]
    message = messages[0] if messages
    user = message[:from] if message
    response_quote = Quote.write_quote
    KikClient.send_message(response_quote, user) if user
    head 200
  end

  private

  def kik_event_params
    message_attributes = [:body, :from, :timestamp, :mention, :participants, :readReceiptRequested, :type, :id, :chatId]
    params.permit({messages: message_attributes}).to_h
  end
end

