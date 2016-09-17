require './app/messengers/kikClient.rb'
class KikApiController < ApplicationController
  

  def webhook
    # puts '===', kik_event_params[:kik_api], "---"
    # KikClient.on_data data
    #ActionController::Parameters.permit_all_parameters = true
    user = params.to_h[:messages][0][:from]
    response_quote = Quote.write_quote
    KikClient.send_message(response_quote, user)
    head 200
    
  end

  private

  # def kik_event_params
  #   params.require(:kik_api).permit(:messages)
  # end

end
