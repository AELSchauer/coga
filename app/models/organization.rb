class Organization
  def self.find(args)
    args[:company_id] ? Company.find(args[:company_id]) : Partner.find(args[:partner_id])
  end

  def self.find_by(**args)
    binding.pry
    Company.find_by(args) || Partner.find_by(args)
  end

  def self.where(**args)
    binding.pry
    Company.where(args) || Partner.where(args)
  end
end
