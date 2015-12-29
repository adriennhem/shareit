class ConfirmationEnrollmentMailer < ActionMailer::Base
  default from: "hello@workshopr.me"
  def confirmation_enrollment(user, lecture, enrollment)
    mail(to: user.email,
    	 subject: "You have successfully enrolled to #{lecture.title}",
    	 body: "You have successfully enrolled to #{lecture.title}. You can now access the course directly from your dashboard. Your receipt is available in billings. Thank you very much")
  end 
end