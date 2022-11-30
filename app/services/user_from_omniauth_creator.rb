# frozen_string_literal: true

class UserFromOmniauthCreator < ApplicationService
  def initialize(auth)
    @auth = auth
  end

  def call
    User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  attr_reader :auth
end
