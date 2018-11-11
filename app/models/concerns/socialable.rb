module Socialable
  extend ActiveSupport::Concern

  included do
    has_many :social_profiles, as: :socialable
  end
end