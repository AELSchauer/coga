module Roleable
  extend ActiveSupport::Concern

  included do
    has_many :roles, as: :roleable
  end
end
