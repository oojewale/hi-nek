class SmsService
  def initialize(citizen_id:)
    @citizen = Citizen.find(citizen_id)
  end

  def perform!
    client.api.account.messages.create(
      from: ENV.fetch('SMS_SENDER'),
      to: citizen.phone,
      body: message
    )
  rescue Twilio::REST::RestError => e
    Rails.logger.error("Could not send sms to #{ citizen.full_name }. See error => #{ e.message }")
    raise e.message
  end

  private

  attr_reader :citizen

  def message
    "Hello #{ citizen.full_name }, visit our office to pick up your permanent voter's slip."
  end

  def client
    account_sid = ENV.fetch('ACCOUNT_SID')
    auth_token = ENV.fetch('AUTH_TOKEN')

    Twilio::REST::Client.new account_sid, auth_token
  end
end
