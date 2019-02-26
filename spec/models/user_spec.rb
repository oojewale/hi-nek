require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#with_citizen" do
    let(:user) { create(:user) }

    it "has citizen association" do
      expect(user.with_citizen.citizen).to be_a Citizen
    end
  end
end
