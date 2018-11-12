class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles
  belongs_to :roleable, polymorphic: true, optional: true

  validates :name, presence: true

  enum name: [ :employee, :coordinator, :administrator ]
end
