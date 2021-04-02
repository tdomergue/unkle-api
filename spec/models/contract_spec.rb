require 'rails_helper'

describe Contract do
  
  it "has a valid factory" do
    expect(build(:contract)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  let(:contract) { build(:contract) }

  describe "ActiveModel validations" do
    
    # Basic validations
    it { expect(contract).to validate_presence_of(:number) }
    it { expect(contract).to validate_uniqueness_of(:number) }
    it { expect(contract).to validate_presence_of(:status) }
    it { expect(contract).to validate_presence_of(:start_date) }
    it { expect(contract).to allow_value(nil).for(:end_date) }

    # Format validations
    it { expect(contract).to_not allow_value(Date.parse('19/06/1990')).for(:end_date) }
    it { expect(contract).to_not allow_value("test").for(:status) }

    # Inclusion/acceptance of values
    it { expect(contract).to validate_inclusion_of(:status).in_array(['pending', 'active', 'finished']) }
  end

  describe "ActiveRecord Associations" do
    it { expect(contract).to have_many(:subscriptions) }
    it { expect(contract).to have_many(:users) }
  end

end
