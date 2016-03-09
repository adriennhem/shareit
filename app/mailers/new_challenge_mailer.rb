class NewChallengeMailer < ActionMailer::Base
  default from: "adrien@workshopr.me"
  def new_challenge(project)
    mail(to: "hello@workshopr.me", 
    	subject: "New Challenge Waiting for Approval", 
    	body: "#{project.main_contact_email} has created a new challenge: #{project.title}")
  end 
end