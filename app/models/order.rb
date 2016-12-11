class Order < ApplicationRecord
  # Assign an API key on create
  before_create :set_auth_token

  private
  def set_auth_token
    return if access_token.present?
    self.access_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
