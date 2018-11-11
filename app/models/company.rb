class Company < ApplicationRecord
  include Roleable
  include Socialable

  has_many :partners

  validates :name, presence: true
  validates :email_domain, presence: true
  validates :url, presence: true
end
