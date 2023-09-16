require 'faraday'
require 'logger'

module Clients
  # Creating bots its really easy with Telegram API !!! That's why I use it as example and for PoC
  # Check this out: https://core.telegram.org/bots
  class Telegram

    @@logger = Logger.new($stdout)

    def initialize
      @url = "https://api.telegram.org/bot#{ENV['TELEGRAM_API_TOKEN']}"

      @conn = Faraday.new(url: @url) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end

    def send_message(chat_id, text)
      response = @conn.post('sendMessage',
                            { chat_id: chat_id, text: text }.to_json,
                            { 'Content-Type' => 'application/json' })
      @@logger.info(response)
      response
    end

  end
end
