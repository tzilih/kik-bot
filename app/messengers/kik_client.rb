require 'HTTParty'
class KikClient
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

  def self.send_message(message, username, type='text', keyboards=nil)
    endpoint = '/message'
    if keyboards.nil?
      kik_message = {body: message, to: username, type: type}
    else
      kik_message = {body: message, to: username, type: type, keyboards: keyboards}
    end
    body = {:messages => [kik_message]}.to_json
    headers =  
    {
      'Content-Type' => 'application/json', 
      'Accept' => 'application/json'
      }
    payload = {body: body, headers: headers}
    post(endpoint, payload)
  end

  def self.on_message message
    case message[:type]
    when 'start-chatting'
      on_start_chatting message
    when 'text'
      on_text message
    when 'link'
    when 'picture'
    when 'video'
    when 'scan-data'
    when 'sticker'
    when 'is-typing'
    when 'delivery-receipt'
    when 'read-receipt'
    when 'friend-picker'
    else
      user = message[:from] if message
      bot_response = "hello else"
      KikClient.send_message(bot_response, user) if user
    end
  end

  def self.on_text message
    body = message[:body]
    user = message[:from] if message
    case body
    when 'Like'
      #TODO - keep track of number of counts
    when 'New Quote'
    response_quote = Quote.get_one
    quote_keyboard = [
      {to: user,
       type: "suggested",
       responses: [
         {
          type: "text",
          body: "New Quote"
         },
         {
          type: "text",
          body: "Like"
         }
                  ]
      }
    ]
    KikClient.send_message(response_quote, user, 'text', quote_keyboard) if user
    else 
      quote_request = 'What kind of quote do you want to see?'
      quote_types = [
        {to: user,
         type: "suggested",
         responses: [
         {
          type: "text",
          body: "Buddhist"
         },
         {
          type: "text",
          body: "Funny"
         }
                  ]
      }
      ]
      KikClient.send_message(quote_request, user, 'text', quote_types)
  end
  end


end
