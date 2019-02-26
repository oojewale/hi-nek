require 'rails_helper'
RSpec.describe SmsWorker, type: :worker do
  it "enqueues job" do
    citizen_id = 1

    expect { SmsWorker.perform_async(citizen_id)
      }.to change(SmsWorker.jobs, :size).by(1)
  end
end
