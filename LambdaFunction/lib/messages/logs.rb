# frozen_string_literal: true

module Messages
  # Modify to add more messages or change the default
  module Logs
    INFO = {
      start: "Starting Lambda Function",
      sent: "Sent message",
      received: "Received message",
      finish: "Finishing Lambda Function",
    }

    ERROR = {
      no_chat_id: "No chat id found",
      no_prompt: "No prompt found",
      no_message: "No message found",
      no_event: "No event found",
      no_body: "No body found",
      no_text: "No text found",
      unprocessable: "Unprocessable request. Did you send a text message?",
      invalid_role: "Invalid role. Options are :system, :assistant and :user",
    }

    def self.debug(message, object = nil) = object.nil? ? "#{message}" : "#{message}: #{object.inspect}"

  end
end
