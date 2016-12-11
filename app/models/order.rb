class Order < ApplicationRecord
  # Assign an API key on create
  before_create :generate_api_key

  private
  # Generate a unique API key
  def generate_api_key
    self.access_token = SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
