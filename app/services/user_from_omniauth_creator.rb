# frozen_string_literal: true

class UserFromOmniauthCreator < ApplicationService
  START_PASSWORD_LENGTH = 0
  END_PASSWORD_LENGTH = 20

  def initialize(auth)
    @auth = auth
  end

  def call
    User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[START_PASSWORD_LENGTH, END_PASSWORD_LENGTH]
    end
  end

  private

  attr_reader :auth
end
