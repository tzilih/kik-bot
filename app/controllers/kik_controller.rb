
class KikController < ApplicationController

  def index
    @quotes = Quote.get_one
  end

  def get_quote
    quote = Quote.get_one.to_json
    render json: quote
    
  end

  def webhook
    messages = kik_event_params[:messages]
    messages.each { |message| KikClient.on_message message }
    #response_quote = Quote.get_one
    #KikClient.send_message(response_quote, user) if user
    head 200
  end

  private

  def kik_event_params
    message_attributes = [:body, :from, :timestamp, :mention, :participants, :readReceiptRequested, :type, :id, :chatId]
    params.permit({messages: message_attributes}).to_h
  end
end

