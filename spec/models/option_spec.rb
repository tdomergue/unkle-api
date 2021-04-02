require 'rails_helper'

describe Option do
  
  it "has a valid factory" do
    expect(build(:option)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  let(:option) { build(:option) }

  describe "ActiveModel validations" do
    # Basic validations
    it { expect(option).to validate_presence_of(:title) }
    it { expect(option).to validate_presence_of(:identifier) }
    it { expect(option).to allow_value(nil).for(:description) }

    # Inclusion/acceptance of values
    it { expect(option).to validate_length_of(:title).is_at_most(100) }
  end

  describe "ActiveRecord Associations" do
    it { expect(option).to have_many(:contract_options) }
    it { expect(option).to have_many(:contracts) }
  end

end
