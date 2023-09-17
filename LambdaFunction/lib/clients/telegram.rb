# frozen_string_literal: true

require "faraday"
require "logger"

module Clients
  # Creating bots its really easy with Telegram API !!! That's why I use it as example and for PoC
  # Check this out: https://core.telegram.org/bots
  class Telegram
    def initialize
      @logger = Logger.new($stdout)
      @url = "https://api.telegram.org/bot#{ENV.fetch('TELEGRAM_API_TOKEN', nil)}"

      @conn = Faraday.new(url: @url) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end

    def send_message(chat_id, text)
      response = @conn.post("sendMessage",
                            { chat_id:, text: }.to_json,
                            { "Content-Type" => "application/json" })
      @logger.info(response)
      response
    end
  end
end
