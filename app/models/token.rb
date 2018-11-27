class Token < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :token, presence: true

  enum name: [ :confirmation, :password_reset, :unlock ]

  before_create do
    token = SecureRandom.urlsafe_base64
  end

  def reroll
    token = SecureRandom.urlsafe_base64
    save
  end
end
