require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:roles) }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }

  it { should validate_presence_of(:first_name) }

  it { should validate_presence_of(:last_name) }

  it { should validate_presence_of(:company_email) }
  it { should validate_uniqueness_of(:company_email) }
  it { should allow_value("email@address.io").for(:company_email) }
  it { should_not allow_value("foo").for(:company_email) }

  it { should validate_uniqueness_of(:contact_email) }
  it { should allow_value("email@address.io").for(:contact_email) }
  it { should allow_value("", nil).for(:contact_email) }
  it { should_not allow_value("foo").for(:contact_email) }

  it { should validate_presence_of(:status) }
end