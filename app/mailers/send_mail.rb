class SendMail < ActionMailer::Base
  default :from => "mailer@danivians.info", 
          :retutn_path => "noreply@danivians.info"

  def auchub_user_registration ()
    mail(:to => "anand@danivians.info", :subject => "Welcome from AuctionHub").deliver
  end 

  def auchub_user_email_confirmation (send_to)
    ComposeMail = mail (:to => send_to.email_address_with_name,
                        :from => "mailer@danivians.info",
                        :return_path => "noreply@danivians",
                        :subject => "Welcome from AuctionHub") 
    do |format|
        auchub_user_email_confirmation.txt.erb
        auchub_mail_footer.txt.erb
    end

    Mail.deliver
  end 
end
