class Mailer < ActionMailer::Base
  default :from => "bryan.earlyadopter@gmail.com"
  # default :to => "bryan.earlyadopter@gmail.com"

  def form_email(to, subject, body)
  	@body = body
  	mail(:to => to, :subject => subject)
  end

end
