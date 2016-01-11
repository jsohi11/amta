class Subscriber < ActiveRecord::Base

  # Notify our appointment attendee X minutes before the appointment time
  def send_message(msg, image_url)
    @twilio_number = ENV['+19093452682']
    @client = Twilio::REST::Client.new ENV['AC7de7ef54a0668e0d73f626dcd25c784c'], ENV['e008c7d0d652fd4a662a4dc0f40bb1c8']
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => msg,
      :media_url => image_url
    )
    puts message.to
  end

end
