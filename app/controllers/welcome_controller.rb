class WelcomeController < ApplicationController
  
  def index
     sms_fu = SMSFu::Client.configure(:delivery => :action_mailer)
# #    sms_fu = SMSFu::Client.configure(:delivery => :pony, :pony_config => { :via => :sendmail })
     sms_fu.deliver(ENV['TEST_PHONE'],"vodafone-spain","message")
  end
end
