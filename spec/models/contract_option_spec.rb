require 'rails_helper'

describe ContractOption do
  
  it "has a valid factory" do
    expect(build(:contract_option)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  let(:contract_option) { build(:contract_option) }

  describe "ActiveRecord Associations" do
    it { expect(contract_option).to belong_to(:option) }
    it { expect(contract_option).to belong_to(:contract) }
  end

end
