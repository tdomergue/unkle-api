require 'rails_helper'

describe Subscription do
  
  it "has a valid factory" do
    expect(build(:subscription)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  let(:subscription) { build(:subscription) }

  describe "ActiveRecord Associations" do
    it { expect(subscription).to belong_to(:user) }
    it { expect(subscription).to belong_to(:contract) }
  end

end
