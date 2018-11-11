class CompanyPartner < ApplicationRecord
  belongs_to :company
  belongs_to :partner
end
