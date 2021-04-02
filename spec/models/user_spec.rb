require 'rails_helper'

describe User do
  
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  let(:user) { build(:user) }

  describe "ActiveModel validations" do
    # Basic validations
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:password) }
    it { expect(user).to validate_presence_of(:admin) }
    it { expect(user).to validate_length_of(:password).is_at_least(6) }

    # Format validations
    it { expect(user).to allow_value("dhh@nonopinionated.com").for(:email) }
    it { expect(user).to_not allow_value("base@example").for(:email) }
    it { expect(user).to_not allow_value("blah").for(:email) }
    it { expect(user).to_not allow_value("12345").for(:password) }
  end

  describe "ActiveRecord Associations" do
    it { expect(user).to have_many(:subscriptions) }
    it { expect(user).to have_many(:contracts) }
  end

end
