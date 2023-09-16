# frozen_string_literal: true

require 'openai'
require 'logger'

# Example of a client class for OpenAI
module Clients
  # Inherit from OpenAI::Client to setting up for your own use case
  # Check an example here: https://github.com/Maclenn77/genial-o-4000/blob/main/genialo/lib/clients/openai.rb
  class OpenAI < OpenAI::Client
    # Set up your own configuration
  end
end