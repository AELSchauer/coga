class Partner < ApplicationRecord
  include Roleable
  include Socialable

  has_many :companies
  has_many :events

  validates :name, presence: true
  validates :email_domain, presence: true
  validates :url, presence: true
end
