class User < ApplicationRecord
  has_secure_password

  has_many :tokens
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :username, presence: true,
                       uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :primary_email, presence: true,
                            uniqueness: true,
                            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :status, presence: true

  enum status: [ :active, :inactive ]

  after_create do
    create_token(:confirmation)
  end

  def login_attributes
    attributes.symbolize_keys.keep_if {|k,v| [:username, :primary_email, :id].include? k }
  end

  def response_attributes
    attributes.symbolize_keys.reject! {|k,v| [:confirmation_token, :password_digest].include? k }
  end

  def json_web_token
    JsonWebToken.encode(login_attributes)
  end

  def email_domain
    primary_email.match(/@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i)[0]
  end

  def employee_email?
    Company.pluck(:email_domain).sort.include? email_domain
  end

  def create_token(name)
    self.tokens.create(name: name)
  end

  def destroy_token(name)
    self.tokens.find_by(name: name).destroy
  end

  def confirmed?
    !self.tokens.find_by(name: :confirmation)
  end

  def locked?
    !!self.tokens.find_by(name: :unlock)
  end
end
