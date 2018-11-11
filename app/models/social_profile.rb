class SocialProfile < ApplicationRecord
  belongs_to :social_network
  belongs_to :socialable, polymporphic: true
end
