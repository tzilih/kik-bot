require 'HTTParty'
class KikApiController < ApplicationController
include HTTParty

  base_uri('https://api.kik.com/v1')
  basic_auth('tziliquotes.dev', '0207a308-108d-4eaa-b5ea-018e57da0512')

  def self.get_config
    get('/config')
  end

  def self.set_config(url)
    headers =  
    {
      'Content-Type' => 'application/json', 
      'Accept' => 'application/json'
      }
    body = {
        webhook: url, 
        features: {
            receiveReadReceipts: false, 
            receiveIsTyping: false, 
            manuallySendReadReceipts: false, 
            receiveDeliveryReceipts: false
        }
    }.to_json
    settings = {headers: headers, body: body}
    post('/config', settings)
  end

  def self.send_message(message, username, type='text')
    endpoint = '/message'
    kik_message = {body: message, to: username, type: type}
    body = {:messages => [kik_message]}.to_json
    headers =  
    {
      'Content-Type' => 'application/json', 
      'Accept' => 'application/json'
      }
    payload = {body: body, headers: headers}
    post(endpoint, payload)
  end

  def get_one
     Quote.write_quote
  end

  def index
     Foo.run
     render text: 'hi'
  end


  # should be the only method
  def webhook
    # puts '===', kik_event_params[:kik_api], "---"
    # KikClient.on_data data
    KikApiController.send_message("hello", 'tzilih')
    render status: 200
  end

  private

  # def kik_event_params
  #   params.require(:kik_api).permit(:messages)
  # end

end
