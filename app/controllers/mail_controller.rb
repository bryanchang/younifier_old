class MailController < ApplicationController
	def form
	end

	def send_email
		@to = params[:to]
		@subject = params[:subject]
		Mailer.form_email(@to, @subject, params[:body]).deliver
	end
end
