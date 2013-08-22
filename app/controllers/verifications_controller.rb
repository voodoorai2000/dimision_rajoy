class VerificationsController < ApplicationController
  def new
    @verification = Verification.new
  end
  
  def create
    @verification = Verification.new(verification_params)
    @verification.code = Random.new.rand(1000...9999)
    @verification.save!
    
    account_sid = ENV['DIMISION_RAJOY_TWILIO_SID']
    auth_token  = ENV['DIMISION_RAJOY_TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = ENV['DIMISION_RAJOY_TWILIO_PHONE']
    code = Random.new.rand(1000...9999)
    
    client.account.sms.messages.create(
      :from => from,
      :to => @verification.phone,
      :body => "DimisionRajoy.com\nCódigo de verificación: #{@verification.code}"
    )
    puts "Código de verificación: #{@verification.code}"
    
    redirect_to edit_verification_path(@verification)
  end
  
  def edit
    @verification = Verification.find(params[:id])
  end
  
  def update
    @verification = Verification.find(params[:id])
    if @verification.code == params[:verification][:code]
      redirect_to new_comment_path
    else
      redirect_to edit_verification_path(@verification), alert: "Código de verificación incorrecto"
    end 
  end
  
  private
  
  def verification_params
    params.require(:verification).permit(:phone, :code)
  end
end