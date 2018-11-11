class Event < ApplicationRecord
  belongs_to :partner
  has_many :vounteers

  validates :title, presence: true
  validates :description, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
end
