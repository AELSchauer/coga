class User < ApplicationRecord
  has_secure_password

  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :username, presence: true,
                       uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company_email, presence: true,
                            uniqueness: true,
                            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :contact_email, allow_blank: true,
                            uniqueness: true,
                            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :status, presence: true

  enum status: [ :active, :inactive ]

  def login_attributes
    self.attributes.symbolize_keys.keep_if {|k,v| [:username, :company_email, :id].include? k }
  end

  def token
    JsonWebToken.encode(login_attributes)
  end
end
