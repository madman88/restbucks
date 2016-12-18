class Order < ApplicationRecord
  # Assign an API key on create
  belongs_to :user
  
  before_create :set_auth_token
  validates :name, :size, :milk, presence: true
  validates :quantity, numericality: { only_integer: true }

  private
  def set_auth_token
    return if access_token.present?
    self.access_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
