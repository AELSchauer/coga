class Role < ApplicationRecord
  belongs_to :user
  belongs_to :roleable, polymporphic: true, as: :organization

  validates :type, presence: true

  enum type: [ :employee, :coordinator, :administrator ]
end
