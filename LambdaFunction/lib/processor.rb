# frozen_string_literal: true

require 'logger'
require_relative 'parametizer'

module Lambda
  # This class processes the event received by the Lambda function
  class Processor
    # Telegram send message as { "body": "{\"message\":{\"chat\":{\"id\": \"user_id\"} }, {\"text\":\"Hello\"}}"
    # Change this Processor to fit your needs
    def initialize(event)
      @message = JSON.parse(event.dig("body"))

      # Add logs for info or debugging
      @logger = Logger.new($stdout)
    end
    
    def process_event
      prompt, chat_id = extract(@message)

      response = prompt ? chat_response(prompt) : logger.error(Messages::Logs::ERROR[:unprocessable])
      
      return respond_request(response) unless chat_id

      respond_telegram(response, chat_id)
    end

    private

    def chat_response(prompt)
      client = Clients::OpenAI.new

      parametizer = Parametizer.new

      messages = [ { role: "user", content: prompt } ]

      parametizer.set_params({messages: messages}) unless prompt == "/start"

      response = client.chat(parameters: parametizer.default_params)
      return response.dig("error", "message") if response.dig("error")

      response.dig("choices", 0, "message", "content")
    end

    def extract(body)
        prompt = body.dig("message", "text")
        chat_id = body.dig("message", "chat", "id")
        
        [prompt, chat_id]
    end

    def missing?(extracted) = extracted.any? { |e| e.nil? }

    def respond_request(reply)
      {
        statusCode: 200,
        body: {
          message: reply,
        }.to_json
      }
    end

    def respond_telegram(reply, chat_id)
      telegram = Clients::Telegram.new
      telegram.send_message(chat_id, reply)
    end
  end
end
    