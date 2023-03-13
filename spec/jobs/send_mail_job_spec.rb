require 'rails_helper'

RSpec.describe SendMailJob, type: :job do
  describe "#perform" do
    include ActiveJob::TestHelper
    
    let(:student) {Student.create(name: "bilal",last_name:"shabbir",phone_no:30132003212,age:43,email:"anything@gmail.com")}
    subject(:job) {SendMailJob.perform_later(student.id)}
    
    it "queue job" do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is in default queue' do
      expect(SendMailJob.new.queue_name).to eq('default')
    end

    it 'executes perform' do

      message_delivery = instance_double(ActionMailer::MessageDelivery)
      expect(MyMailer).to receive(:welcome_email).with(student).and_return(message_delivery)
      allow(message_delivery).to receive(:deliver_later)
      perform_enqueued_jobs { job }
    end

    #cleaning the queue
    after do
      clear_enqueued_jobs
      clear_performed_jobs
    end

  end
end
