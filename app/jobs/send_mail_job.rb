class SendMailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    # Do something later
    user=Student.find(user_id)
    MyMailer.welcome_email(user).deliver_later
  end
end
