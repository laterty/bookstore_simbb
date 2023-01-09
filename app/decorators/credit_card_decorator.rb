# frozen_string_literal: true

class CreditCardDecorator < Draper::Decorator
  delegate_all

  def hidden_number
    "** ** ** #{number[-4..-1]}"
  end
end
