require 'rails_helper'
RSpec.describe SmsService do
  let(:citizen) { create(:citizen) }
  subject { SmsService.new(citizen_id: citizen.id) }

  it "#client"  do
    expect(subject.send(:client)).to be_a Twilio::REST::Client
  end

  it "#message" do
    expect(subject.send(:message)).to include(citizen.full_name)
  end
end
