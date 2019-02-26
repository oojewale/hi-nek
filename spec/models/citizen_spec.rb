require 'rails_helper'

RSpec.describe Citizen, type: :model do
  let(:saved_citizen) { build(:citizen) }
  let(:eligible) { build(:citizen) }
  let(:under_aged) { build(:under_age_citizen) }

  describe "eligibility" do
    it "saves eligible citizens" do
      expect(eligible.save).to be true
    end

    it "does not save under_aged citizens" do
      expect(under_aged.save).to be false
    end

    it "gives dob error to under_aged citizens" do
      under_aged.valid?
      expect(under_aged.errors[:dob]).to include("Too young to participate in an electoral process")
    end
  end

  it "#full_name" do
    expect(eligible.full_name).to_not be nil
  end

  describe 'callbacks' do
    it { is_expected.to callback(:send_sms).after(:update).if :card_marked_ready? }
  end
end
