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
    it { expect(contract).to validate_presence_of(:start_date) }
    it { expect(contract).to allow_value(nil).for(:end_date) }

    # Format validations
    it { expect(contract).to_not allow_value(Date.parse('19/06/1990')).for(:end_date) }
  end

  describe "ActiveRecord Associations" do
    it { expect(contract).to have_many(:subscriptions) }
    it { expect(contract).to have_many(:users) }
  end

  describe "public class methods" do
    context "responds to its method" do
      it { expect(contract).to respond_to(:status) }
    end

    context "executes method correctly" do
      context "contract.status" do
        it "returns 'pending' if today < start_date" do
          expect(build(:contract, start_date: Date.today + 2).status).to eq("pending")
        end
        it "returns 'active' if start_date < today < end_date" do
          expect(contract.status).to eq("active")
        end
        it "returns 'finished' if today > end_date" do
          expect(build(:contract, end_date: Date.today - 2).status).to eq("finished")
        end
      end
    end
  end

end
