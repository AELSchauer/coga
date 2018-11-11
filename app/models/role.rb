class Role < ApplicationRecord
  belongs_to :user
  belongs_to :roleable, polymorphic: true, optional: true

  validates :type, presence: true

  enum type: [ :employee, :coordinator, :administrator ]
end
