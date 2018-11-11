class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :status, presence: true
  validates :hours, presence: true

  enum status: [ :employee_created, :partner_verified, :partner_created, :employee_verified, :company_accepted ]
end
