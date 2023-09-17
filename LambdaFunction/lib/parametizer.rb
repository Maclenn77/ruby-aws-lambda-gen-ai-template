# frozen_string_literal: true

# Modify default params
class Parametizer
  attr_accessor :default_params

  # @param config [Hash]
  # @option config [String] :model
  # @option config [Array<Hash>] :messages
  # Model and messages are required
  # Ex. in json format: {
  #   "model": "gpt-3.5-turbo-16k",
  #   "messages": [
  #     {
  #       "role": "user",
  #       "content": ""
  #     }
  #   ],
  #   "temperature": 1,
  #   "max_tokens": 256,
  #   "top_p": 1,
  #   "frequency_penalty": 0,
  #   "presence_penalty": 0
  # }
  def initialize(config = { model: "gpt-3.5-turbo-16k",
                            messages: [{ role: "user", content: "Hola, Mundo" }] })
    @default_params = config
  end

  def add_params(params) = default_params.merge!(params)

  def replace_params(params) = default_params = params # rubocop:disable Lint/UselessAssignment
end
