# frozen_string_literal: true

module Messages
  # Change this module to add more messages or try different strategics
  # Check best practices here: https://platform.openai.com/docs/guides/gpt-best-practices
  module Content

    # Define a content for the role "system, Ex."
    system = "You're a friendly and funny chatbot"
    sys = Builder.new(role: :system)
    sys_message = sys.build(system)

    # Define a content for the role "assistant, Ex."
    assistant = "I'm a friendly and funny chatbot"
    asst = Builder.new(role: :assistant)
    asst_message = asst.build(assistant)

    # Define a content for the role "user, Ex."
    user = "Hello, World"
    usr = Builder.new(role: :user)
    usr_message = usr.build(user)

    # It's more easy now to add more messages or change previous ones
    # Add it in the parameter as "messages: Messages::Content.example"
    example = [sys_message, asst_message, usr_message]
  end
end
