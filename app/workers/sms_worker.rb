class SmsWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform(citizen_id)
    sms = SmsService.new(citizen_id: citizen_id)
    sms.perform!
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error("No record found for invalid citizen id: #{citizen_id}.")
  end
end
