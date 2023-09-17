# frozen_string_literal: true

module Messages
  class Builder
    attr_reader :message

    ROLES = { user: "user", system: "system", assistant: "assistant" }.freeze

    def initialize(role: :user)
      raise Logs::ERROR[:invalid_role] unless ROLES.keys.include?(role)

      @role = role
    end

    def build(text)
      { role: ROLES[@role], content: text }
    end
  end
end
